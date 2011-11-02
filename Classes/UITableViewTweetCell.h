//
//  UITableViewTweetCell.h
//  AccessExternalAPIiOS
//
//  Created by Ben Hall on 11/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITableViewTweetCell : UITableViewCell {
    IBOutlet UILabel *msg;
}
@property(nonatomic, retain) UILabel *msg;


@end
