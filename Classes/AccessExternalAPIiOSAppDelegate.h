//
//  AccessExternalAPIiOSAppDelegate.h
//  AccessExternalAPIiOS
//
//  Created by Ben Hall on 11/01/11.
//  Copyright 2011 Ben Hall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccessExternalAPIiOSViewController;

@interface AccessExternalAPIiOSAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AccessExternalAPIiOSViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AccessExternalAPIiOSViewController *viewController;

@end

