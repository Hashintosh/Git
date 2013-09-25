//
//  Hitechcode_DialogInterface.h
//
//  Created by Hashintosh
//
//

#import <Foundation/Foundation.h>

@interface Hitechcode_DialogInterface : NSObject<UIWebViewDelegate>

+(DialogInterface *)sharedInterface;

-(void)displayCustomAlertWith:(NSString *)_url toView:(UIView *)_view;

-(void)setAppstoreUrl:(NSString *)mUrl;

@end
