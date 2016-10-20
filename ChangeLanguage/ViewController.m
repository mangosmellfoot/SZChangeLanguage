//
//  ViewController.m
//  ChangeLanguage
//
//  Created by Next on 16/10/20.
//  Copyright © 2016年 Next. All rights reserved.
//

#import "ViewController.h"
#import "SZLanguageLocal.h"
#import "AppDelegate.h"

 #define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Language"]

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic,weak) UILabel * label;
@property (nonatomic,weak) UIButton * button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(30, 50, SCREENWIDTH - 60, SCREENHEIGHT * 0.5)];
    [self.view addSubview:label];
    label.text = [SZLanguageLocal CurrentLanguageWords:@"labelText"];
    label.font = [UIFont systemFontOfSize:23];
    label.backgroundColor = [UIColor grayColor];
    label.numberOfLines = 0;
    self.label = label;
    NSString * string = [SZLanguageLocal CurrentLanguageWords:@"Following system"];
    NSArray * array = @[@"English",@"简体中文",string];
    for (int i = 0; i < 3; i++) {
        NSString * words = array[i];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.view addSubview:button];
        button.frame = CGRectMake(50, CGRectGetMaxY(label.frame) + 70 * i, SCREENWIDTH - 100, 50);
        [button setTitle:words forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(changeLanguage:) forControlEvents:UIControlEventTouchUpInside];
        self.button = button;
    }
}

- (void)refreshSubViewsText {
    self.label.text = [SZLanguageLocal CurrentLanguageWords:@"labelText"];
    [self.button setTitle:[SZLanguageLocal CurrentLanguageWords:@"Following system"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PrivateCode

- (void)changeLanguage:(UIButton *)button {
    __weak ViewController * weakSelf = self;
    
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:[SZLanguageLocal CurrentLanguageWords:@"Change Display Language"] message:[NSString stringWithFormat:@"%@%@",[SZLanguageLocal CurrentLanguageWords:@"Alert Message"], button.titleLabel.text] preferredStyle:UIAlertControllerStyleActionSheet];
    [alertVC addAction:[UIAlertAction actionWithTitle:[SZLanguageLocal CurrentLanguageWords:@"Confirm"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [SZLanguageLocal setLanguagePath:button.tag];
        [weakSelf refreshSubViewsText];
        [alertVC dismissViewControllerAnimated:YES completion:nil];
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:[SZLanguageLocal CurrentLanguageWords:@"Cancel"] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertVC dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [self presentViewController:alertVC animated:YES completion:^{
        
    }];
    
}

- (void)languageChanged{
    AppDelegate * delegate = [UIApplication sharedApplication].delegate;
    
}



@end
