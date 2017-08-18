//
//  ViewController.m
//  WideAdExample
//
//  Created by Jahid on 8/18/17.
//  Copyright © 2017 Jahid. All rights reserved.
//

#import "ViewController.h"
#import "AdSpace.h"

@interface ViewController () <AdSpaceDelegate> {
    AdSpace* adSpace;
}
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    adSpace = [[AdSpace alloc] initWithFrame:self.view.bounds];
    adSpace.delegate = self;
    [self.view addSubview:adSpace];
    
    [self.view bringSubviewToFront:_btnClose];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [adSpace runAd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeAd:(UIButton *)sender {
    [adSpace closeAd];
    
    [adSpace removeFromSuperview];
    adSpace = nil;
    
    [_btnClose removeFromSuperview];
    _btnClose = nil;
}

// AdSpaceDelegate
- (void)willPresentAd {
    NSLog(@"willPresentAd");
}

- (void)didPresentAd {
    NSLog(@"didPresentAd");
}

- (void)willDismissAd {
    NSLog(@"willDismissAd");
}

- (void)didDismissAd {
    NSLog(@"didDismissAd");
}

@end

