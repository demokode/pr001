//
//  Constants.h
//  CultTourist
//
//  Created by DimasSup on 09.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#ifndef CultTourist_Constants_h
#define CultTourist_Constants_h

typedef enum {
	ELeftSideMenuTypes_None,
	ELeftSideMenuTypes_Search,
	ELeftSideMenuTypes_News,
	ELeftSideMenuTypes_Favorite,
	ELeftSideMenuTypes_Bookmarks,
	ELeftSideMenuTypes_Catalog,
	ELeftSideMenuTypes_History,
	ELeftSideMenuTypes_Playlists,
	ELeftSideMenuTypes_Downloads,
	ELeftSideMenuTypes_Settings,
}ELeftSideMenuTypes;

typedef enum {
	EControlState_Disable = 0,
	EControlState_On = 1,
	EControlState_Off = 2,
}EControlState;
typedef enum {
	EActionPanelSide_Left,
	EActionPanelSide_Right,
}EActionPanelSide;
#endif
