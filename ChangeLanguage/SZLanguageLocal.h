//
//  SZLanguageLocal.h
//  ChangeLanguage
//
//  Created by Next on 16/10/20.
//  Copyright © 2016年 Next. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    English,
    Chinese,
    System,
} LanguageItem;

@interface SZLanguageLocal : NSObject

/**
 获取本地语言化string

 @param words stringKey

 @return 应显示出的string
 */
+ (NSString *)CurrentLanguageWords:(NSString *)words;
/**
 设置本地语言

 @param Item 语言种类

 @return 种类语言的翻译文件路径
 */
+ (NSString *)setLanguagePath:(LanguageItem)Item;

@end
