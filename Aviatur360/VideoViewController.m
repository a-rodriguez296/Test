//
//  VideoViewController.m
//  Aviatur360
//
//  Created by Alejandro Rodriguez on 2/1/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

#import "VideoViewController.h"
#import "GVRVideoView.h"

@interface VideoViewController () <GVRVideoViewDelegate>

@property(nonatomic) IBOutlet GVRVideoView *videoView;

@end

@implementation VideoViewController

BOOL _isPaused;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Video";
    
    
    _videoView.delegate = self;
    
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"cascada" ofType:@"mp4"];
    [_videoView loadFromUrl:[[NSURL alloc] initFileURLWithPath:videoPath]
                     ofType:kGVRVideoTypeMono];
    
    
    _videoView.enableCardboardButton = YES;
    _videoView.enableFullscreenButton = YES;
    
    
    _isPaused = YES;
    
}

-(void)widgetView:(GVRWidgetView *)widgetView didLoadContent:(id)content{
    [_videoView play];
    _isPaused = NO;
}

-(void)widgetViewDidTap:(GVRWidgetView *)widgetView{
    
    if (_isPaused){
        [_videoView play];
    }
    else{
        [_videoView pause];
    }
    _isPaused = !_isPaused;
}

-(void)videoView:(GVRVideoView *)videoView didUpdatePosition:(NSTimeInterval)position{
    if (position == _videoView.duration) {
        [_videoView seekTo:0];
        [_videoView play];
    }
}

@end
