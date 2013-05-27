//
//  ViewController.h
//  AddressBookSample00
//
//  Created by zhou Yangbo on 13-5-26.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate>
{
    IBOutlet UILabel *_firstName;
    IBOutlet UILabel *_phoneNumber;
    IBOutlet UIImageView *_imageView;
}
- (IBAction)showPicker:(id)sender;
@property(nonatomic,retain)IBOutlet UILabel *firstName;
@property(nonatomic,retain)IBOutlet UILabel *phoneNumber;
@property(nonatomic,retain)IBOutlet
UIImageView *imageView;

@end
