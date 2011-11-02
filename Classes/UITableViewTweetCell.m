//
//  UITableViewTweetCell.m
//  AccessExternalAPIiOS
//
//  Created by Ben Hall on 11/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UITableViewTweetCell.h";

@implementation UITableViewTweetCell

@synthesize msg;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [msg release];
    [super dealloc];
}


@end
