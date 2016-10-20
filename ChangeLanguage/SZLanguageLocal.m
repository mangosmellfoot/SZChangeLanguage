//
//  SZLanguageLocal.m
//  ChangeLanguage
//
//  Created by Next on 16/10/20.
//  Copyright © 2016年 Next. All rights reserved.
//
#import "SZLanguageLocal.h"

#define LanguagePath [[NSUserDefaults standardUserDefaults] objectForKey:@"LanguagePath"]

@interface SZLanguageLocal ()

@end

@implementation SZLanguageLocal
//获取本地语言化string
+ (NSString *)CurrentLanguageWords:(NSString *)words {
    NSString * languageWords = [[NSBundle bundleWithPath:LanguagePath] localizedStringForKey:words value:nil table:@"Language"];
    return languageWords;
}
//设置本地语言
+ (NSString *)setLanguagePath:(LanguageItem)Item {
    NSString * LanguageItem = @"English";
    switch (Item) {
        case English:
            LanguageItem = @"en";
            break;
        case Chinese:
            LanguageItem = @"zh-Hans";
            break;
        case System:
            LanguageItem = [[NSLocale preferredLanguages] objectAtIndex:0];
            if ([LanguageItem hasPrefix:@"en"]) {
                LanguageItem = @"en";
            } else {
                LanguageItem = @"zh-Hans";
            }
            break;
            
        default:
            break;
    }
    NSString * languagePath = [[NSBundle mainBundle] pathForResource:LanguageItem ofType:@"lproj"];
    [[NSUserDefaults standardUserDefaults] setValue:languagePath forKey:@"LanguagePath"];
    return languagePath;
}

@end
