//
//  PGViewController.m
//  Avatar Example
//
//  Created by Paul Pilone on 5/30/14.
//  Copyright (c) 2014 Paul Pilone. All rights reserved.
//

#import "PGViewController.h"

#import "PGAvatarView.h"

@interface PGViewController ()
@property (weak, nonatomic) IBOutlet PGAvatarView *avatarView;

@end

@implementation PGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.avatarView.image = [UIImage imageNamed:@"paul-avatar.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
