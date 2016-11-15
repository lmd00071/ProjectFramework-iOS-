//
//  McAlertView.m
//  ZJFramework
//
//  Created by 李明丹 on 16/6/20.
//  Copyright © 2016年 别问我是谁. All rights reserved.
//

#import "McAlertView.h"

#define kMcCurrentSystemVersion  [[[UIDevice currentDevice] systemVersion] floatValue]

static McAlertView *alert = nil;

@interface McAlertView ()

@property (nonatomic, strong) NSArray* alertTitleArray;

// 输入框的数量
@property (nonatomic, assign) NSInteger inputTFNumber;

@end

@implementation McAlertView

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alert = [[McAlertView alloc] init];
    });
    return alert;
}

- (void)alertViewTarget:(id)target
          alertViewType:(McAlertViewType)type
                  title:(NSString*)title
                message:(NSString*)message
           actionTitles:(NSArray*)array
clickButtonResponseBlock:(McAlertViewResponseBlock)block{
    NSAssert(type != McAlertViewTypeTextFieldAlertView, @"此方法不能使用带输入框的方法!");
    [[McAlertView shareInstance] alertViewTarget:target
                                   alertViewType:type
                                           title:title
                                         message:message
                                    actionTitles:array
                           textFieldPlaceHolders:nil
                         textFieldsArrayResponse:nil
                        clickButtonResponseBlock:block];
}

- (void)alertViewTarget:(id)target
          alertViewType:(McAlertViewType)type
                  title:(NSString*)title
                message:(NSString*)message
           actionTitles:(NSArray*)array
  textFieldPlaceHolders:(NSArray*)placeHolders
textFieldsArrayResponse:(void(^)(NSArray*))textFieldBlock
clickButtonResponseBlock:(McAlertViewResponseBlock)block{
    
    NSAssert([target isKindOfClass:[UIView class]] || [target isKindOfClass:[UIViewController class]], @"显示的主控制器设置出错！请检查!");
    
    if ([target isKindOfClass:[UIView class]] && (type == McAlertViewTypeActionSheet && kMcCurrentSystemVersion > 8.0)) {
        NSAssert(kMcCurrentSystemVersion <= 8.0, @"在当前版本控制器应该为UIViewController的子类");
    }
    
    _alertTitleArray = array;
    _responseBlock = [block copy];
    _inputTFNumber = 0;
    
    if (kMcCurrentSystemVersion <= 8.0) {
        // 如果为alertView类型则创建alertView
        if (type == McAlertViewTypeAlertView) {
            // 确保按钮个数在1个以上
             NSAssert(array.count > 0, @"没有设置按钮！请检查!");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                                message:message
                                                               delegate:alert
                                                      cancelButtonTitle:array[0]
                                                      otherButtonTitles:nil, nil];
            for (int i = 1; i < array.count ; i++) {
                [alertView addButtonWithTitle:array[i]];
            }
            [alertView show];
        }
        // actionSheet类型则创建ActionSheet
        else if(type == McAlertViewTypeActionSheet){
            // 确保按钮个数在2个以上
             NSAssert(array.count > 1, @"没有设置按钮！请检查!");
            UIActionSheet *actionSheet = [[UIActionSheet alloc] init];
            actionSheet.title = title;
            actionSheet.delegate = alert;
            for (int i = 1; i < array.count; i++) {
                [actionSheet addButtonWithTitle:array[i]];
            }
            
            [actionSheet addButtonWithTitle:array[0]];
            actionSheet.cancelButtonIndex = array.count-1;
            if ([target isKindOfClass:[UIView class]]) {
                [actionSheet showInView:target];
            }else if([target isKindOfClass:[UIViewController class]]){
                UIViewController *viewCtrl = (UIViewController*)target;
                [actionSheet showInView:viewCtrl.view];
            }
        }
        // 创建带输入框的alertView
        else if (type == McAlertViewTypeTextFieldAlertView){
            NSAssert(array.count > 0, @"没有设置按钮！请检查!");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                                message:message
                                                               delegate:alert
                                                      cancelButtonTitle:array[0]
                                                      otherButtonTitles:nil, nil];
            NSAssert(placeHolders.count > 0 && placeHolders.count <3, @"设置的输入框过少/过多，请检查");
            _inputTFNumber = placeHolders.count;
            
            if (placeHolders.count == 1) {
                alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
            }else{
                alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
            }
            
            for (int i = 0; i < placeHolders.count; i++) {
                UITextField *textField = [alertView textFieldAtIndex:i];
                textField.placeholder = placeHolders[i];
                textField.secureTextEntry = NO;
                textField.delegate = target;
            }
            
            if (textFieldBlock) {
                NSMutableArray *muArray = [NSMutableArray array];
                for (int i = 0; i < placeHolders.count; i++) {
                    UITextField *textField = [alertView textFieldAtIndex:i];
                    [muArray addObject:textField];
                }
               textFieldBlock(muArray);
            }
            
            for (int i = 1; i < array.count; i++) {
                [alertView addButtonWithTitle:array[i]];
            }
            [alertView show];
        }
    }else if ([target isKindOfClass:[UIViewController class]]){
        NSAssert(array.count > 0, @"没有设置按钮！请检查!");
        UIViewController *viewCtrl = (UIViewController*)target;
        __weak typeof(self) weakSelf = self;
        _inputTFNumber = placeHolders.count;
        UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:title
                                                                           message:message
                                                                    preferredStyle:(type == McAlertViewTypeAlertView || placeHolders.count > 0)?UIAlertControllerStyleAlert:UIAlertControllerStyleActionSheet];
        
        [alertCtrl addAction:[UIAlertAction actionWithTitle:array[0] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (weakSelf.responseBlock) {
                weakSelf.responseBlock(0, nil, nil);
            }
        }]];
        for (int i = 0; i < placeHolders.count; i++) {
            [alertCtrl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.placeholder = placeHolders[i];
                textField.delegate = target;
            }];
        }
        if (textFieldBlock) {
            textFieldBlock(alertCtrl.textFields);
        }
        
        for (int i = 1; i < array.count; i++) {
          [alertCtrl addAction:[UIAlertAction actionWithTitle:array[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
              if (weakSelf.responseBlock) {
                  NSMutableArray *array = [NSMutableArray array];
                  for (int i = 0; i < _inputTFNumber; i++) {
                      UITextField *textField = alertCtrl.textFields[i];
                      [array addObject:(textField.text && ![textField.text isEqualToString:@""])?textField.text:@""];
                  }
                   weakSelf.responseBlock(i, array, alertCtrl.textFields);
              }
          }]];
        }

        [viewCtrl presentViewController:alertCtrl animated:YES completion:nil];
    }
}

// 根据数组的长度来返回数组的值
- (id)accoundingArrayDataReturnDataWithArray:(NSArray*)array index:(NSInteger)index{
    if (index <= array.count - 1) {
        return array[index];
    }
    return nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (_responseBlock) {
        NSMutableArray *array = [NSMutableArray array];
        NSMutableArray *textFieldArray = [NSMutableArray array];
        for (int i= 0; i < _inputTFNumber; i++) {
            UITextField *textField = [alertView textFieldAtIndex:i];
            [array addObject:(textField.text && ![textField.text isEqualToString:@""])?textField.text:@""];
            [textFieldArray addObject:textField];
        }
        _responseBlock(buttonIndex, array, textFieldArray);
    }
    [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (_responseBlock) {
        if (buttonIndex < _alertTitleArray.count - 1) {
            buttonIndex++;
             _responseBlock(buttonIndex, nil, nil);
        }else{
            _responseBlock(0, nil, nil);
        }
    }
}



@end
