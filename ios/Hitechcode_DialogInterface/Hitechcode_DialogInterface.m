//
//  Hitechcode_DialogInterface.m
//
//  Created by Hasith Ambegoda
//
//

#import "Hitechcode_DialogInterface.h"

@implementation Hitechcode_DialogInterface

NSString *appUrl =nil;
UIView *xView;
static Hitechcode_DialogInterface *sharedInterface = nil;


+(Hitechcode_DialogInterface *)sharedInterface{
    @synchronized(self){
        if(!sharedInterface){
            sharedInterface = [[super allocWithZone:NULL]init];
        }
        return  sharedInterface;
    }
}

#pragma mark custom alert
-(void)displayCustomAlertWith:(NSString *)_url toView:(UIView *)_view{
    
    //uiview animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    
    xView = [[UIView alloc]initWithFrame:CGRectMake(40, 50, 240, 350)];
    xView.alpha = 0;
    xView.backgroundColor = [UIColor clearColor];
    [_view addSubview:xView];
    
    xView.alpha = 1;
    [UIView commitAnimations];
    
    //call webview
    UIWebView *webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 240,350)];
    webview.scrollView.scrollEnabled = NO;
    webview.scrollView.bounces = NO;
    webview.delegate = self;
    NSString *url= _url;
    NSURL *nsurl=[NSURL URLWithString:url];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [webview loadRequest:nsrequest];
    [xView addSubview:webview];
    
    //add close button
    UIButton *mButton = [UIButton buttonWithType:UIButtonTypeCustom];
    mButton.frame = CGRectMake(200,-15,50,50);
    [mButton setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    [mButton addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [xView addSubview:mButton];
    
    xView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        // animate it to the identity transform 
        xView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished){
        // if you want to do something once the animation finishes, put it here
    }];
}

-(void)setAppstoreUrl:(NSString *)mUrl{
    appUrl = mUrl;
}

-(NSString *)getAppstoreUrl{
    return appUrl;
}
-(IBAction)buttonTouched:(id)sender{
    [xView removeFromSuperview];
}

@end
