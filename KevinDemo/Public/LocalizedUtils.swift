import Foundation

extension String {
  var localized: String {
        Bundle.main.onLanguage()
        return NSLocalizedString(self, comment: self)
    }






//Common
//  static var localized_Redbot: String { return "Redbot".localized }
//  static var localized_Group: String { return "Group".localized }
//  static var localized_Cancel: String { return "Cancel".localized }
//  static var localized_Invite: String { return "Invite".localized }
//  static var localized_Invited: String { return "Invited".localized }
//  static var localized_login: String { return "login".localized }
//
//  static var localized_Choose: String { return "Choose".localized }
//  static var localized_choose: String { return "choose".localized }
//  static var localized_Take_a_Photo: String { return "Take_a_Photo".localized }
//  static var localized_Photo_Library: String { return "Photo_Library".localized }
//  static var localized_no_more_data: String { return "no_more_data".localized }
//
////add friends
//  static var localized_Firends_on_Redsip: String { return "Firends_on_Redsip".localized }
//  static var localized_Invite_friends_to_join: String { return "Invite_friends_to_join".localized }
//
//
////Create&Edit Group
//  static var localized_Choose_A_Group: String { return "Choose_A_Group".localized }
//  static var localized_New_Group: String { return "New_Group".localized }
//  static var localized_Edit_Group: String { return "Edit_Group".localized }
//  static var localized_Add_a_Photo: String { return "Add_a_Photo".localized }
//  static var localized_Group_Name: String { return "Group_Name".localized }
//  static var localized_Group_Description: String { return "Group_Description".localized }
//  static var localized_Location: String { return "Location".localized }
//  static var localized_Add_Friends_to_Group: String { return "Add_Friends_to_Group".localized }
//  static var localized_Create: String { return "Create".localized }
//  static var localized_Save: String { return "Save".localized }
//  static var localized_No_Meetups_yet: String { return "No_Meetups_yet".localized }
//  static var localized_Create_My_First_Meetup: String { return "Create_My_First_Meetup".localized }
//
////Group List
//  static var localized_Member: String { return "Member".localized }
//  static var localized_Members: String { return "Members".localized }
//  static var localized_Create_My_First_Group: String { return "Create_My_First_Group".localized }
//  static var localized_Wine_Tasting_is_more_fun_with_your_friends: String { return "Wine_Tasting_is_more_fun_with_your_friends".localized }
//
////Post detail
//  static var localized_Write_comment: String { return "Write_comment".localized }
////Post
//  static var localized_Create_post: String { return "Create_post".localized }
//  static var localized_Add_Photos: String { return "Add_Photo".localized }
//  static var localized_Tag_Friends: String { return "Tag_Friends".localized }
//  static var localized_Here_are_some_suggestions: String { return "Here are some suggestions".localized }
////suggestions
//  static var localized_earthy: String { return "earthy".localized }
//  static var localized_acetic: String { return "acetic".localized }
//  static var localized_astringent: String { return "astringent".localized }
//  static var localized_light: String { return "light".localized }
//  static var localized_developed: String { return "developed".localized }
//  static var localized_mature: String { return "mature".localized }
//  static var localized_metallic: String { return "metallic".localized }
//  static var localized_fresh: String { return "fresh".localized }
//  static var localized_flat: String { return "flat".localized }
//  static var localized_grapey: String { return "grapey".localized }
//  static var localized_bright: String { return "bright".localized }
//  static var localized_balanced: String { return "balanced".localized }
//  static var localized_austere: String { return "austere".localized }
//  static var localized_thin: String { return "thin".localized }
//  static var localized_tart: String { return "tart".localized }
//  static var localized_tired: String { return "tired".localized }
//  static var localized_sulfury: String { return "sulfury".localized }
//  static var localized_seductive: String { return "seductive".localized }
//  static var localized_vanilla: String { return "vanilla".localized }
//  static var localized_woody: String { return "woody".localized }
//  static var localized_young: String { return "young".localized }
//  static var localized_rich: String { return "rich".localized }
//  static var localized_nutty: String { return "nutty".localized }
//  static var localized_caramelized: String { return "caramelized".localized }
//  static var localized_fruity: String { return "fruity".localized }
//  static var localized_spicy: String { return "spicy".localized }
//  static var localized_butter: String { return "butter".localized }
//  static var localized_cream: String { return "cream".localized }
//  static var localized_smoky: String { return "smoky".localized }
//  static var localized_mineral: String { return "mineral".localized }
//  static var localized_fresh_herb: String { return "fresh_herb".localized }
//  static var localized_dried_herb: String { return "dried_herb".localized }
//  static var localized_floral: String { return "floral".localized }
//  static var localized_citrus: String { return "citrus".localized }
//  static var localized_tropical: String { return "tropical".localized }
//  static var localized_tree_fruits: String { return "tree_fruits".localized }
//  static var localized_black_fruits: String { return "black_fruits".localized }
//  static var localized_red_fruits: String { return "red_fruits".localized }
//  static var localized_dried_fruits: String { return "dried_fruits".localized }
//  static var localized_Tag_Wine: String { return "Tag_Wine".localized }
//
////Create&Edit Meetup
//  static var localized_New_Meetup: String { return "New_Meetup".localized }
//  static var localized_Meetup_Title: String { return "Meetup_Title".localized }
//  static var localized_Meetup_Detail: String { return "Meetup_Detail".localized }
//  static var localized_Date: String { return "Date".localized }
//  static var localized_Time: String { return "Time".localized }
//  static var localized_Done: String { return "Done".localized }
//  static var localized_Edit_Meetup: String { return "Edit_Meetup".localized }
//  static var localized_people_are_going: String { return "people_are_going".localized }
//  static var localized_IM_GOING: String { return "IM_GOING".localized }
//  static var localized_Write_something: String { return "Write_something".localized }
//  static var localized_friends_are_going: String { return "friends_are_going".localized }
//  static var localized_friend_is_going: String { return "friend_is_going".localized }
//
////Notifications
//  static var localized_Notifications: String { return "Notifications".localized }
//
//  static var localized_My_Wines: String { return "My_Wines".localized }
//
//  static var localized_male: String { return "male".localized }
//  static var localized_female: String { return "female".localized }
//  static var localized_unknow: String { return "unknow".localized }
//
//
////Mine Setting
//  static var localized_Setting: String { return "Setting".localized }
//  static var localized_Language: String { return "Language".localized }
//  static var localized_Push_Notification: String { return "Push_Notification".localized }
//  static var localized_Terms_and_Conditions: String { return "Terms_and_Conditions".localized }
//  static var localized_Sign_Out: String { return "Sign_Out".localized }
//
//  static var localized_Choose_Language: String { return "Choose_Language".localized }
//  static var localized_English: String { return "English".localized }
//  static var localized_Chinese: String { return "Chinese".localized }
//  static var localized_Setting_Language: String { return "Setting_Language".localized }

}
