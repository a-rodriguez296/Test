//
//  PhotoViewController.m
//  Aviatur360
//
//  Created by Alejandro Rodriguez on 2/1/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

#import "PhotoViewController.h"
#import "GVRPanoramaView.h"

@interface PhotoViewController ()
@property (weak, nonatomic) IBOutlet GVRPanoramaView *panoramaView;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Foto";
    
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"sindhu_beach" ofType:@"jpg"];
    
    [_panoramaView loadImage:[UIImage imageNamed:videoPath] ofType:kGVRPanoramaImageTypeMono];
    _panoramaView.enableCardboardButton = YES;
    _panoramaView.enableFullscreenButton = YES;
    
}

@end
