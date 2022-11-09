// Copyright © 2022 Nico Petri, 03172 Guben, Germany
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files
// (the “Software”), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to permit
// persons to whom the Software is furnished to do so, subject to the following
// conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//
//  group2d.y
//  Created by Nico Petri on 25.08.2000.

/*********************************************************************
*	
*	This is the grammar file that parse the 2D scenes. This gram-
*	mar is copied from the group.y and only some little changes
*	was needed to get the 2D grammar.
*	Look in the group2d.y file for more details.
*	
*********************************************************************/

%{
#include <stdlib.h>
#include "../clang/header/node_table.h"
#include "../clang/header/shared_dec.h"
extern int zzlex();
extern int zzerror();
%}

/****************** BISON Declarations *****************************/

%token_table

%union {
		int INT;
		char* STR;
	}

/****************** General Declarations ***************************/

%token	d_Number
%token	d_String
%token	d_TRUE
%token	d_FALSE

/****************** on Top Level************************************/

%token	n_Group2D
%token	n_WorldInfo

/****************** Nodes ******************************************/

%token	n_AnimationStream
%token	n_Appearance
%token	n_AudioDelay
%token	n_AudioFX
%token	n_AudioMix
%token	n_AudioSource
%token	n_AudioSwitch
%token	n_Box
%token	n_Circle
%token	n_Color
%token	n_ColorInterpolator
%token	n_Conditional
%token	n_Cone
%token	n_Coordinate2D
%token	n_CoordinateInterpolator
%token	n_Cylinder
%token	n_DiscSensor
%token	n_FontStyle
%token	n_Form
%token	n_Image2D
%token	n_ImageTexture
%token	n_IndexedFaceSet2D
%token	n_IndexedLineSet2D
%token	n_Inline2D
%token	n_Layout
%token	n_LineProperties
%token	n_Material2D
%token	n_MovieTexture
%token	n_PointSet2D
%token	n_Position2DInterpolator
%token	n_Rectangle
%token	n_ScalarInterpolator
%token	n_Shape
%token	n_Sound2D
%token	n_Sphere
%token	n_Switch2D
%token	n_Text
%token	n_TextureCoordinate
%token	n_TextureTransform
%token	n_TimeSensor
%token	n_TouchSensor
%token	n_Transform2D

/****************** Fields *****************************************/

%token	ef_appearance
%token	ef_autoOffset
%token	ef_buffer
%token	ef_center
%token	ef_children
%token	ef_choice
%token	ef_color
%token	ef_coord
%token	ef_constraint
%token	ef_cycleInterval
%token	ef_delay
%token	ef_drawingOrder
%token	ef_emissiveColor
%token	ef_enabled
%token	ef_filled
%token	ef_fontStyle
%token	ef_geometry
%token	ef_groups
%token	ef_groupsIndex
%token	ef_intensity
%token	ef_horizontal
%token	ef_justify
%token	ef_key
%token	ef_keyValue
%token	ef_leftToRight
%token	ef_length
%token	ef_lineColor
%token	ef_lineProps
%token	ef_lineStyle
%token	ef_location
%token	ef_loop
%token	ef_material
%token	ef_matrix
%token	ef_maxAngle
%token	ef_maxExtent
%token	ef_minAngle
%token	ef_numInputs
%token	ef_offset
%token	ef_orch
%token	ef_params
%token	ef_pitch
%token	ef_point
%token	ef_radius
%token	ef_rotation
%token	ef_rotationAngle
%token	ef_scale
%token	ef_scaleOrientation
%token 	ef_score
%token	ef_scrollRate
%token	ef_scrollVertical
%token	ef_size
%token	ef_smothScroll
%token	ef_source
%token	ef_spacing
%token	ef_speed
%token	ef_startTime
%token	ef_stopTime
%token	ef_string
%token	ef_texCoord
%token	ef_texture
%token	ef_textureTransform
%token	ef_translation
%token	ef_transparency
%token	ef_topToBottom
%token	ef_url
%token	ef_wichChoice
%token	ef_width
%token	ef_wrap

%token	f_bboxCenter
%token	f_bboxSize
%token	f_bottom
%token	f_bottomRadius
//	f_center == ef_center
%token	f_colorIndex
%token	f_colorPerVertex
%token	f_convex
%token 	f_coordIndex
//	f_description == ef_description
%token	f_family
%token	f_height
//	f_horizontal == ef_horizontal
%token	f_info
//	f_justify == ef_justify
%token	f_language
//	f_leftToRight == ef_leftToRight
%token	f_numChan
%token	f_phaseGroup
//	f_radius == ef_radius
%token	f_repeatS
%token	f_repeatT
%token	f_side
//	f_size == ef_size
//	f_spacing == ef_spacing
%token	f_spatialize
%token	f_style
%token	f_texCoordIndex
%token	f_title
%token	f_top
//	f_topToBottom == ef_topToBottom

/****************** events ****************************************/


%token	ei_activate
%token	ei_addChildren
%token	ei_removeChildren
%token	ei_reverseActivate
%token	ei_set_colorIndex
%token	ei_set_coordIndex
%token	ei_set_fraction
%token	ei_set_texCoordIndex
%token	ei_set_texCoordIndex


%token	eo_cycleTime
%token	eo_duration_changed
%token	eo_fraction_changed
%token	eo_hitNormal_changed
%token	eo_hitPoint_changed
%token	eo_hitTexCoord_changed
%token	eo_isActive
%token	eo_isOver
%token	eo_rotation_changed
%token	eo_time
%token	eo_touchTime
%token	eo_trackPoint_changed
%token	eo_value_changed

/****************** reserved words and symbols *********************/

%token	kw_APPEND_TO
%token	kw_AT
%token	kw_BY
%token	kw_DEF
%token	kw_DELETE
%token	kw_Identifier
%token	kw_INSERT
%token	kw_LAST
%token	kw_OD	
%token	kw_REPLACE
%token	kw_ROUTE
%token	kw_UPDATE
%token	kw_USE
%token	kw_TO 

/****************** special keywords *******************************/

%token	skw_ROUTE_DEF	// "ROUTE DEF"
%token	skw_Route_Identifier	// this token is never used in rule; the
				// push_node_data need a unused integer for
				// storing, so the pop_node_data can differ from
				// other identifiers like node identifiers etc.

%token	skw_unknown		// every symbol that is not a lexical element
%token	skw_url			// just like Route_Identifier

/*******************************************************************/

%token	od_AU_Length
%token	od_accessUnitRate
%token	od_alConfigDescr
%token	od_avgBitrate
%token	od_bufferSizeDB
%token	od_compatibility
%token	od_compositionUnitRate
%token	od_content_identifier
%token	od_decConfigDescr
%token	od_degradationPriorityLength
%token	od_dependsOn_ES_number
%token	od_descriptorData
%token	od_descriptorTag
%token	od_es_descriptor
%token	od_es_Number
%token	od_extensionDescriptor
%token	od_fileName
%token	od_instantBitrateLength
%token	od_IP_IDSs
%token	od_IPI_ES_Id
%token	od_ipiDescr
%token	od_language_code
%token	od_maxBitrate
%token	od_OCR_ES_Id
%token	od_OCRLength
%token	od_OCRResolution
%token	od_objectDescriptorID
%token	od_predefined
%token	od_profileAndLevelIndication
%token	od_QoS_Qualifier
%token	od_qosDescr
%token	od_remoteODflag
%token	od_seqNumLength
%token	od_specificInfo
%token	od_startCompositionTimeStamp
%token	od_startDecodingTimeStamp
%token	od_streamData
%token	od_streamPriority
%token	od_streamType
%token	od_supplementaryContentIdentifier
%token	od_timeStampLength
%token	od_timeStampResolution
//	ef_title == f_title
%token	od_type_of_content
%token	od_type_of_content_identifier
%token	od_upStream
%token	od_useAccessUnitEndFlag
%token	od_useAccessUnitStartFlag
%token	od_usePaddingFlag
%token	od_useRandomAccessPointFlag
%token	od_useTimeStampsFlag
%token	od_useWallClockTimeStampFlag
%token	od_useWallClockTimeStampLength
//	od_url == ef_url
%token	od_wallClockTimeStamp
%token	od_value

%%
ALL:	  SCENE
	| ALL SCENE
	;

SCENE:	  GROUP2D_NODE
	| UPDATE_COMMAND
	| '{' UPDATE_COMMANDS '}'
	| kw_AT d_Number '{' UPDATE_COMMANDS '}'
	| kw_AT d_Number '{' '}'
	{
	fprintf(stderr, "line %i: warning; empty update command\n",line);
	}
	| ROUTE_DEFINITIONS
	;

/****************** UPDATES ****************************************/

UPDATE_COMMANDS:	  UPDATE_COMMAND
			| UPDATE_COMMANDS UPDATE_COMMAND
			;

UPDATE_COMMAND:		  kw_DELETE kw_Identifier
			| kw_REPLACE kw_Identifier kw_BY MF_NODE
			| kw_REPLACE ROUTE_SOURCE_REF kw_BY  FIELD_VALUE
			| kw_INSERT kw_AT UPDATE_COMMANDS_REF '[' SF_NUMBER_DATA ']'  SF_FIELD_VALUE
			| kw_APPEND_TO UPDATE_COMMANDS_REF
			| kw_DELETE UPDATE_COMMANDS_REF '[' SF_NUMBER_DATA ']'
			| kw_DELETE kw_LAST UPDATE_COMMANDS_REF
			| kw_REPLACE UPDATE_COMMANDS_REF '[' SF_NUMBER_DATA ']' kw_BY SF_FIELD_VALUE
			| kw_REPLACE kw_LAST UPDATE_COMMANDS_REF kw_BY SF_FIELD_VALUE
  			| kw_UPDATE kw_OD OBJECT_DESCRIPTORS
			| kw_UPDATE kw_OD '[' OBJECT_DESCRIPTORS ']'
			;

/****************** ROUTE DEFINITIONS ******************************/

ROUTE_DEFINITIONS:	  kw_ROUTE ROUTE_SOURCE_REF kw_TO ROUTE_TARGET_REF
			| skw_ROUTE_DEF kw_Identifier ROUTE_SOURCE_REF kw_TO ROUTE_TARGET_REF
			{
			push_node_data( $<STR>2, skw_Route_Identifier);
			}
			;


/******************* for ROUTE **************************************/

/*********************************************************************
*
*	The lexer return the token type number by using the 
*	pop_node_data(char*) funktion with the identifier.
*
*********************************************************************/

ROUTE_SOURCE_REF:	  n_AnimationStream '.' ANIMATION_STREAM_EVENTOUT
			| n_ColorInterpolator '.'INTERPOLATOR_EVENTOUT
			| n_Conditional '.' CONDITIONAL_EVENTOUT
			| n_CoordinateInterpolator '.' INTERPOLATOR_EVENTOUT
			| n_DiscSensor '.' DISC_SENSOR_EVENTOUT
			| n_MovieTexture '.' MOVIE_TEXTURE_EVENTOUT
			| n_TimeSensor '.' TIME_SENSOR_EVENTOUT
			| n_TouchSensor '.' TOUCH_SENSOR_EVENTOUT
			| EXP_FIELD_EVENTS
			;

ROUTE_TARGET_REF:	  n_AudioDelay '.' AUDIO_DELAY_EVENTIN
			| n_AudioFX '.' AUDIO_FX_EVENTIN
			| n_AudioMix '.' AUDIO_MIX_EVENTIN
			| n_AudioSource '.' AUDIO_SOURCE_EVENTIN
			| n_ColorInterpolator '.' INTERPOLATOR_EVENTIN
			| n_Conditional '.' CONDITIONAL_EVENTIN
			| n_CoordinateInterpolator '.' INTERPOLATOR_EVENTIN
			| n_Form '.' FORM_EVENTIN
			| n_Group2D '.' GROUP2D_EVENTIN
			| n_IndexedFaceSet2D '.' INDEXED_FACE_SET2D_EVENTIN
			| n_IndexedLineSet2D '.' INDEXED_LINE_SET2D_EVENTIN
			| n_Layout '.' LAYOUT_EVENTIN
			| n_Transform2D '.' TRANSFORM2D_EVENTIN
			| EXP_FIELD_EVENTS
			;

/******************* exposedField Events ****************************/

/*********************************************************************
*
*	Every exposedField has an EventIn and an EventOut. This is de-
*	cribed by this nonterminal. It is also used by ROUTE commands.
*	
*	This definition is different to the referenz for the update
*	commands. After an exposedField Event in a ROUTE definition,
*	never follows a value like SF_NUMBER_DATA. 
*
*********************************************************************/

EXP_FIELD_EVENTS:	  n_Appearance '.' APPEARANCE_EVENT
			| n_AnimationStream '.' ANIMATION_STREAM_EVENT
			| n_AudioDelay '.' AUDIO_DELAY_EVENT
			| n_AudioFX '.' AUDIO_FX_EVENT
			| n_AudioMix '.' AUDIO_MIX_EVENT
			| n_AudioSource '.' AUDIO_SOURCE_EVENT
			| n_AudioSwitch '.' AUDIO_SWITCH_EVENT
			| n_Box '.' BOX_EVENT
			| n_Circle '.' CIRCLE_EVENT
			| n_Color '.' COLOR_EVENT
			| n_ColorInterpolator '.' INTERPOLATOR_EVENT
			| n_Conditional '.' CONDITIONAL_EVENT
			| n_Coordinate2D '.' COORDINATE2D_EVENT
			| n_CoordinateInterpolator '.' INTERPOLATOR_EVENT
			| n_DiscSensor '.' DISC_SENSOR_EVENT
			| n_Form '.' FORM_EVENT
			| n_Image2D '.' IMAGE2D_EVENT// isn't a mistake, see definition
			| n_ImageTexture '.' IMAGE_TEXTURE_EVENT
			| n_IndexedFaceSet2D '.' INDEXED_FACE_SET2D_EVENT
			| n_IndexedLineSet2D '.' INDEXED_LINE_SET2D_EVENT
			| n_Inline2D '.' INLINE2D_EVENT
			| n_Layout '.' LAYOUT_EVENT
			| n_LineProperties '.' LINE_PROPERTIES_EVENT
			| n_Material2D '.' MATERIAL2D_EVENT
			| n_MovieTexture '.' MOVIE_TEXTURE_EVENT
			| n_PointSet2D '.' POINT_SET2D_EVENT
			| n_Rectangle '.' RECTANGLE_EVENT
			| n_ScalarInterpolator '.' SCALAR_INTERPOLATOR_EVENT
			| n_Shape '.' SHAPE_EVENT
			| n_Sound2D '.' SOUND2D_EVENT
			| n_Sphere '.' SPHERE_EVENT
			| n_Switch2D '.' SWITCH2D_EVENT
			| n_Text '.' TEXT_EVENT
			| n_TextureCoordinate '.' TEXTURE_COORDINATE_EVENT
			| n_TextureTransform '.' TEXTURE_TRANSFORM_EVENT
			| n_TimeSensor '.' TIME_SENSOR_EVENT
			| n_TouchSensor '.' TOUCH_SENSOR_EVENT
			| n_Transform2D '.' TRANSFORM2D_EVENT
			;

/******************* reference for the updata commands***************/

/*********************************************************************
*
*	Look for the comment in the "exposedField Event" section for
*	more details about this nonterminal definition.
*
*********************************************************************/

UPDATE_COMMANDS_REF:	  n_Appearance '.' APPEARANCE_EXP_FIELD
			| n_AudioDelay '.' AUDIO_DELAY_EXP_FIELD
			| n_AudioFX '.' AUDIO_FX_EXP_FIELD
			| n_AudioMix '.' AUDIO_MIX_EXP_FIELD
			| n_AudioSource '.' AUDIO_SOURCE_EXP_FIELD
			| n_AudioSwitch '.' AUDIO_SWITCH_EXP_FIELD
			| n_Box '.' BOX_EXP_FIELD
			| n_Circle '.' CIRCLE_EXP_FIELD
			| n_Color '.' COLOR_EXP_FIELD
			| n_ColorInterpolator '.' INTERPOLATOR_EXP_FIELD
			| n_Conditional '.' CONDITIONAL_EXP_FIELD
			| n_CoordinateInterpolator '.' INTERPOLATOR_EXP_FIELD
			| n_DiscSensor '.' DISC_SENSOR_EXP_FIELD
			| n_Form '.' FORM_EXP_FIELD
			| n_Group2D '.' GROUP2D_EXP_FIELD
			| n_Image2D '.' IMAGE2D_NODE// isn't a mistake, see definition
			| n_ImageTexture '.' IMAGE_TEXTURE_EXP_FIELD
			| n_IndexedFaceSet2D '.' INDEXED_FACE_SET2D_EXP_FIELD
			| n_IndexedLineSet2D '.' INDEXED_LINE_SET2D_EXP_FIELD
			| n_Inline2D '.' INLINE2D_EXP_FIELD
			| n_LineProperties '.' LINE_PROPERTIES_EXP_FIELD
			| n_Material2D '.' MATERIAL2D_EXP_FIELD
			| n_MovieTexture '.' MOVIE_TEXTURE_EXP_FIELD
			| n_PointSet2D '.' POINT_SET2D_EXP_FIELD// is the same
			| n_ScalarInterpolator '.' SCALAR_INTERPOLATOR_EXP_FIELD
			| n_Shape '.' SHAPE_EXP_FIELD
			| n_Sound2D '.' SOUND2D_EXP_FIELD
			| n_Switch2D '.' SWITCH2D_EXP_FIELD
			| n_Text '.' TEXT_EXP_FIELD
			| n_TextureCoordinate '.' TEXTURE_COORDINATE_EXP_FIELD
			| n_TextureTransform '.' TEXTURE_TRANSFORM_EXP_FIELD
			| n_TouchSensor '.' TOUCH_SENSOR_EXP_FIELD
			| n_Transform2D '.' TRANSFORM2D_EXP_FIELD
			;

/****************** TOP Level - Node ********************************/

GROUP2D_NODE:	  n_Group2D '{' GROUP2D_FIELDS '}'
		| kw_DEF kw_Identifier n_Group2D
 		{
		push_node_data($<STR>2, $<INT>3);
		} '{' GROUP2D_FIELDS '}'
		| n_Group2D '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_USE n_Group2D
		;

GROUP2D_FIELDS:	  GROUP2D_FIELD
		| GROUP2D_EXP_FIELD
		| GROUP2D_FIELDS GROUP2D_FIELD
		| GROUP2D_FIELDS GROUP2D_EXP_FIELD
		;

GROUP2D_EVENTIN:  ei_addChildren MF_NODE
		| ei_addChildren error ']'
		{
		fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable node expected\n");
		}
		| ei_removeChildren MF_NODE
		| ei_removeChildren error ']'
		{
		fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable node expected\n");
		}
		;

GROUP2D_EXP_FIELD:	  ef_children MF_NODE
			| ef_children error ']'
			{
			fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable node expected\n");
			}
			;

GROUP2D_FIELD:	  f_bboxCenter SF_VEC3F_DATA
		| f_bboxSize SF_VEC3F_DATA
		;

/*******************************************************************/

MF_NODE:	  '[' MANY_SF_NODE ']'
		;

MANY_SF_NODE:	  SF_NODE
		| MANY_SF_NODE SF_NODE
		;

SF_NODE:	  FORM_NODE	
		| INLINE2D_NODE
		| LAYOUT_NODE
		| SWITCH2D_NODE
		| TRANSFORM2D_NODE
/* end of grouping nodes					*/
		| DISC_SENSOR_NODE
		| TIME_SENSOR_NODE
		| TOUCH_SENSOR_NODE
/* end of Sensor nodes						*/
		| COLOR_INTERPOLATOR_NODE
		| POSITION2D_INTERPOLATOR_NODE
		| SCALAR_INTERPOLATOR_NODE
/* end of Interpolator nodes					*/
		| ANIMATION_STREAM_NODE
		| CONDITIONAL_NODE
		| SHAPE_NODE
		| SOUND2D_NODE
		| WORLD_INFO_NODE
		;

/********************************************************************/

SF_GEOMETRY_NODE:	  BOX_NODE
			| CIRCLE_NODE
			| CONE_NODE
			| CYLINDER_NODE
			| INDEXED_FACE_SET2D_NODE
			| INDEXED_LINE_SET2D_NODE
			| POINT_SET2D_NODE
			| RECTANGLE_NODE
			| SPHERE_NODE
			| TEXT_NODE
			;

SF_TEXTURE_NODE:	  IMAGE_TEXTURE_NODE
			| MOVIE_TEXTURE_NODE
			;

MF_AUDIO_BIFS_NODE:	  SF_AUDIO_BIFS_NODE
			| MF_AUDIO_BIFS_NODE SF_AUDIO_BIFS_NODE
			;

SF_AUDIO_BIFS_NODE:	  AUDIO_SOURCE_NODE
			| AUDIO_DELAY_NODE
			| AUDIO_MIX_NODE
			| AUDIO_SWITCH_NODE
			| AUDIO_FX_NODE
			;

/********************************************************************/

ANIMATION_STREAM_NODE:	  n_AnimationStream '{' ANIMATION_STREAM_FIELDS '}'
			| n_AnimationStream '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier ANIMATION_STREAM_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_AnimationStream
			;

ANIMATION_STREAM_FIELDS:	  ANIMATION_STREAM_EXP_FIELD
				| ANIMATION_STREAM_FIELDS ANIMATION_STREAM_EXP_FIELD
				;

ANIMATION_STREAM_EVENT:		  ef_loop
				| ef_speed
				| ef_startTime
				| ef_stopTime
				| ef_url
				;
				
ANIMATION_STREAM_EXP_FIELD:	  ef_loop SF_BOOL_DATA
				| ef_speed SF_NUMBER_DATA
				| ef_startTime SF_NUMBER_DATA
				| ef_stopTime SF_NUMBER_DATA 
				| ef_url skw_url
				{
				push_node_data( $<STR>2, $<INT>2 )
				}
				;

ANIMATION_STREAM_EVENTOUT:	  eo_isActive
				;

/*******************************************************************/

APPEARANCE_NODE:	  n_Appearance '{' APPEARANCE_FIELDS '}'
			| n_Appearance '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier APPEARANCE_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_Appearance
			;

APPEARANCE_FIELDS:	  APPEARANCE_EXP_FIELD
			| APPEARANCE_FIELDS APPEARANCE_EXP_FIELD
			;

APPEARANCE_EVENT:	  ef_material
			| ef_texture
			| ef_textureTransform
			;

APPEARANCE_EXP_FIELD:	  
			| ef_material MATERIAL2D_NODE
			| ef_material error '}'
			{
			fprintf(stderr, "\t -> Material node expected\n");
			}
			| ef_texture SF_TEXTURE_NODE
			| ef_texture error '}'
			{
			fprintf(stderr, "\t -> Texture node expected\n");
			}
			| ef_textureTransform TEXTURE_TRANSFORM_NODE
			| ef_textureTransform error '}'
			{
			fprintf(stderr, "\t -> textureTransform node expected\n");
			}
			;

/*******************************************************************/

AUDIO_DELAY_NODE:	  n_AudioDelay '{' AUDIO_DELAY_FIELDS '}'
			| n_AudioDelay '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier AUDIO_DELAY_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_AudioDelay
			;

AUDIO_DELAY_FIELDS:	  AUDIO_DELAY_FIELD
			| AUDIO_DELAY_EXP_FIELD
			| AUDIO_DELAY_FIELDS AUDIO_DELAY_FIELD
			| AUDIO_DELAY_FIELDS AUDIO_DELAY_EXP_FIELD
			;

AUDIO_DELAY_EVENT:	  ef_children
			| ef_delay
			;

AUDIO_DELAY_EVENTIN:	  ei_addChildren '[' MF_AUDIO_BIFS_NODE ']'
			| ei_addChildren error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			| ei_removeChildren '[' MF_AUDIO_BIFS_NODE ']'
			| ei_removeChildren error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			;

AUDIO_DELAY_EXP_FIELD:	  ef_children '[' MF_AUDIO_BIFS_NODE ']'
			| ef_children error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			| ef_delay SF_NUMBER_DATA
			;

AUDIO_DELAY_FIELD:	  f_numChan SF_NUMBER_DATA
			| f_phaseGroup MF_NUMBER_DATA
			;

/*******************************************************************/

AUDIO_FX_NODE:	  n_AudioFX '{' AUDIO_FX_FIELDS '}'
		| n_AudioFX '{' '}'
		| kw_DEF kw_Identifier AUDIO_FX_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_AudioFX
		;

AUDIO_FX_FIELDS:	  AUDIO_FX_FIELD
			| AUDIO_FX_EXP_FIELD
			| AUDIO_FX_FIELDS AUDIO_FX_FIELD
			| AUDIO_FX_FIELDS AUDIO_FX_EXP_FIELD
			;

AUDIO_FX_EVENT:		  ef_children
			| ef_orch
			| ef_score
			| ef_params
			;

AUDIO_FX_EVENTIN:	  ei_addChildren '[' MF_AUDIO_BIFS_NODE ']'
			| ei_addChildren error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			| ei_removeChildren '[' MF_AUDIO_BIFS_NODE ']'
			| ei_removeChildren error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			;

AUDIO_FX_EXP_FIELD:	  ef_children '[' MF_AUDIO_BIFS_NODE ']'
			| ef_children error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			| ef_orch MF_STRING_DATA
			| ef_score MF_STRING_DATA
			| ef_params MF_NUMBER_DATA
			;

AUDIO_FX_FIELD:	  f_numChan SF_NUMBER_DATA
		| f_phaseGroup MF_NUMBER_DATA
		;

/*******************************************************************/

AUDIO_MIX_NODE:	  n_AudioMix '{' AUDIO_MIX_FIELDS '}'
		| n_AudioMix '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier AUDIO_MIX_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_AudioMix
		;

AUDIO_MIX_FIELDS:	  AUDIO_MIX_FIELD
			| AUDIO_MIX_EXP_FIELD
			| AUDIO_MIX_FIELDS AUDIO_MIX_FIELD
			| AUDIO_MIX_FIELDS AUDIO_MIX_EXP_FIELD
			;

AUDIO_MIX_EVENT:	  ef_children
			| ef_numInputs
			| ef_matrix
			;

AUDIO_MIX_EVENTIN:	  ei_addChildren '[' MF_AUDIO_BIFS_NODE ']'
			| ei_addChildren error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			| ei_removeChildren '[' MF_AUDIO_BIFS_NODE ']'
			| ei_removeChildren error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			;


AUDIO_MIX_EXP_FIELD:	  ef_children '[' MF_AUDIO_BIFS_NODE ']'
			| ef_children error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			| ef_numInputs SF_NUMBER_DATA
			| ef_matrix MF_NUMBER_DATA
			;

AUDIO_MIX_FIELD:	  f_numChan SF_NUMBER_DATA
			| f_phaseGroup MF_NUMBER_DATA
			;

/*******************************************************************/

AUDIO_SOURCE_NODE:	  n_AudioSource '{' AUDIO_SOURCE_FIELDS '}'
			| n_AudioSource '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier AUDIO_SOURCE_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_AudioSource
			;

AUDIO_SOURCE_FIELDS:	  AUDIO_SOURCE_FIELD
			| AUDIO_SOURCE_EXP_FIELD
			| AUDIO_SOURCE_FIELDS AUDIO_SOURCE_FIELD
			| AUDIO_SOURCE_FIELDS AUDIO_SOURCE_EXP_FIELD
			;

AUDIO_SOURCE_EVENT:	  ef_children
			| ef_url
			| ef_pitch
			| ef_speed
			| ef_startTime
			| ef_stopTime
			;

AUDIO_SOURCE_EVENTIN:	  ei_addChildren '[' MF_AUDIO_BIFS_NODE ']'
			| ei_addChildren error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			| ei_removeChildren '[' MF_AUDIO_BIFS_NODE ']'
			| ei_removeChildren error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			;

AUDIO_SOURCE_EXP_FIELD:	  ef_children '[' MF_AUDIO_BIFS_NODE ']'
			| ef_children error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			| ef_url skw_url
			{
			push_node_data( $<STR>2, $<INT>2 )
			}
			| ef_pitch SF_NUMBER_DATA
			| ef_speed SF_NUMBER_DATA
			| ef_startTime SF_NUMBER_DATA
			| ef_stopTime SF_NUMBER_DATA
			;		


AUDIO_SOURCE_FIELD:		  f_numChan SF_NUMBER_DATA
				| f_phaseGroup MF_NUMBER_DATA
				;

/*******************************************************************/

AUDIO_SWITCH_NODE:	  n_AudioSwitch '{' AUDIO_SWITCH_FIELDS '}'
			| n_AudioSwitch '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier AUDIO_SWITCH_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_AudioSwitch
			;

AUDIO_SWITCH_FIELDS:	  AUDIO_SWITCH_FIELD
			| AUDIO_SWITCH_EXP_FIELD
			| AUDIO_SWITCH_FIELDS AUDIO_SWITCH_FIELD
			| AUDIO_SWITCH_FIELDS AUDIO_SWITCH_EXP_FIELD
			;

AUDIO_SWITCH_EVENT:	  ef_children
			| ef_wichChoice
			;

AUDIO_SWITCH_EXP_FIELD:	  ef_children '[' MF_AUDIO_BIFS_NODE ']'
			| ef_children error ']'
			{
			fprintf(stderr, "\t -> AUDIO_BIFS_NODE expected\n");
			}
			| ef_wichChoice MF_NUMBER_DATA
			;
			
AUDIO_SWITCH_FIELD:	  f_numChan SF_NUMBER_DATA
			| f_phaseGroup MF_NUMBER_DATA
			;
			
/*******************************************************************/
 
BOX_NODE:	  n_Box '{' BOX_EXP_FIELD '}'
		| n_Box '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier BOX_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Box
		;

BOX_EVENT:	  ef_size
		;

BOX_EXP_FIELD:	  ef_size SF_VEC2F_DATA
		;

/*******************************************************************/

CIRCLE_NODE:	  n_Circle '{' CIRCLE_EXP_FIELD '}'
		| n_Circle '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier CIRCLE_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Circle
		;

CIRCLE_EVENT:	  ef_radius
		;

CIRCLE_EXP_FIELD:	  ef_radius SF_NUMBER_DATA
			;

/*******************************************************************/

COLOR_NODE:	  n_Color '{' COLOR_EXP_FIELD '}'
		| n_Color '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier COLOR_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Color
		;

COLOR_EVENT:	  ef_color
		;

COLOR_EXP_FIELD:	  ef_color MF_VEC3F_DATA
			;

/*******************************************************************/

COLOR_INTERPOLATOR_NODE:	  n_ColorInterpolator '{' INTERPOLATOR_FIELDS '}'
				| n_ColorInterpolator '{' '}'
				{
				fprintf(stderr, "line %i: warning; empty node\n",line);
				}
				| kw_DEF kw_Identifier COLOR_INTERPOLATOR_NODE
				{
				push_node_data($<STR>2, $<INT>3);
				}
				| kw_USE n_ColorInterpolator
				;
				
/*******************************************************************/

CONDITIONAL_NODE:	  n_Conditional '{' CONDITIONAL_EXP_FIELD '}'
			| n_Conditional '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier CONDITIONAL_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_Conditional
			;

CONDITIONAL_EVENT:	  ef_buffer
			;

CONDITIONAL_EVENTIN:	  ei_activate
			| ei_reverseActivate
			;

CONDITIONAL_EXP_FIELD:	  ef_buffer d_String
			;

CONDITIONAL_EVENTOUT:	  eo_isActive
			;

/*******************************************************************/

CONE_NODE:	  n_Cone '{' CONE_FIELDS '}'
		| n_Cone '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier CONE_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Cone
		;

CONE_FIELDS:	  CONE_FIELD
		| CONE_FIELDS CONE_FIELD
		;

CONE_FIELD:	  f_bottomRadius SF_NUMBER_DATA
		| f_height SF_NUMBER_DATA
		| f_side SF_BOOL_DATA
		| f_bottom SF_BOOL_DATA
		;


/*******************************************************************/

COORDINATE2D_NODE:	  n_Coordinate2D '{' COORDINATE2D_EXP_FIELD '}'
			| n_Coordinate2D '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier COORDINATE2D_EXP_FIELD
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_Coordinate2D
			;

COORDINATE2D_EVENT:	  ef_point
			;

COORDINATE2D_EXP_FIELD:	  ef_point MF_VEC2F_DATA
			;

/*******************************************************************/

CYLINDER_NODE:	  n_Cylinder '{' CYLINDER_FIELDS '}'
		| n_Cylinder '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier CYLINDER_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Cylinder
		;

CYLINDER_FIELDS:	  CYLINDER_FIELD
			| CYLINDER_FIELDS CYLINDER_FIELD
			;

CYLINDER_FIELD:	  f_bottom SF_BOOL_DATA
		| f_height SF_NUMBER_DATA
		| ef_radius SF_NUMBER_DATA	// ef_radius == f_radius
		| f_side SF_BOOL_DATA
		| f_top SF_BOOL_DATA
		;

/*******************************************************************/

DISC_SENSOR_NODE:	  n_DiscSensor '{' DISC_SENSOR_FIELDS '}'
			| n_DiscSensor '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier DISC_SENSOR_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_DiscSensor
			;

DISC_SENSOR_FIELDS:	  DISC_SENSOR_EXP_FIELD
			| DISC_SENSOR_FIELDS DISC_SENSOR_EXP_FIELD
			;

DISC_SENSOR_EVENT:	  ef_autoOffset
			| ef_enabled
			| ef_maxAngle
			| ef_minAngle
			| ef_offset
			;

DISC_SENSOR_EXP_FIELD:	  ef_autoOffset SF_BOOL_DATA
			| ef_enabled SF_BOOL_DATA
			| ef_maxAngle SF_NUMBER_DATA
			| ef_minAngle SF_NUMBER_DATA
			| ef_offset SF_NUMBER_DATA
			;

DISC_SENSOR_EVENTOUT:	  eo_isActive
			| eo_rotation_changed
			| eo_trackPoint_changed
			;

/*******************************************************************/

FONT_STYLE_NODE:	  n_FontStyle '{' FONT_STYLE_FIELDS '}'
			| n_FontStyle '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier FONT_STYLE_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_FontStyle
			;

FONT_STYLE_FIELDS:	  FONT_STYLE_FIELD
			| FONT_STYLE_FIELDS FONT_STYLE_FIELD
			;

FONT_STYLE_FIELD:	  f_family d_String
			| ef_horizontal SF_BOOL_DATA
			| ef_justify d_String
			| f_language d_String
			| ef_leftToRight SF_BOOL_DATA
			| ef_size SF_NUMBER_DATA
			| ef_spacing SF_NUMBER_DATA
			| f_style d_String
			| ef_topToBottom SF_BOOL_DATA
			;

/*******************************************************************/

FORM_NODE:	  n_Form '{' FORM_FIELDS '}'
		| n_Form '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier FORM_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Form
		;

FORM_FIELDS:	  FORM_EXP_FIELD
		| FORM_FIELDS FORM_EXP_FIELD
		;

FORM_EVENT:	  ef_children
		| ef_size
		| ef_groups
		| ef_constraint
		| ef_groupsIndex
		;

FORM_EVENTIN:	  ei_addChildren MF_NODE
		| ei_addChildren error ']'	
		{
		fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable expected\n");
		}
		| ei_removeChildren MF_NODE
		| ei_removeChildren error ']'
		{
		fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable expected\n");
		}
		;

FORM_EXP_FIELD:	  ef_children MF_NODE
		| ef_children error ']'
		{
		fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable expected\n");
		}
		| ef_size SF_VEC2F_DATA
		| ef_groups MF_NUMBER_DATA
		| ef_constraint MF_NUMBER_DATA
		| ef_groupsIndex MF_NUMBER_DATA
		;

/*******************************************************************/

IMAGE2D_NODE:	  n_Image2D '{' ef_url skw_url '}'
		{
		push_node_data( $<STR>4, $<INT>4 )
		}
		| n_Image2D '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier IMAGE2D_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Image2D
		;

IMAGE2D_EVENT:	  ef_url skw_url
		;

/*******************************************************************/

IMAGE_TEXTURE_NODE:	  n_ImageTexture '{' IMAGE_TEXTURE_FIELDS '}'
			| n_ImageTexture '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier IMAGE_TEXTURE_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_ImageTexture
			;

IMAGE_TEXTURE_FIELDS:	  IMAGE_TEXTURE_FIELD
			| IMAGE_TEXTURE_EXP_FIELD
			| IMAGE_TEXTURE_FIELDS IMAGE_TEXTURE_FIELD
			| IMAGE_TEXTURE_FIELDS IMAGE_TEXTURE_EXP_FIELD
			;
IMAGE_TEXTURE_EVENT:	  ef_url skw_url
			;

IMAGE_TEXTURE_EXP_FIELD:	  ef_url skw_url 
				{
				push_node_data( $<STR>2, $<INT>2 )
				}
				;

IMAGE_TEXTURE_FIELD:	  f_repeatS SF_BOOL_DATA
			| f_repeatT SF_BOOL_DATA
			;

/*******************************************************************/

INDEXED_FACE_SET2D_NODE:	  n_IndexedFaceSet2D '{' INDEXED_FACE_SET2D_FIELDS '}'
				| n_IndexedFaceSet2D '{' '}'
				{
				fprintf(stderr, "line %i: warning; empty node\n",line);
				}
				| kw_DEF kw_Identifier INDEXED_FACE_SET2D_NODE
				{
				push_node_data($<STR>2, $<INT>3);
				}
				| kw_USE n_IndexedFaceSet2D
				;

INDEXED_FACE_SET2D_FIELDS:	  INDEXED_FACE_SET2D_FIELD
				| INDEXED_FACE_SET2D_EXP_FIELD
				| INDEXED_FACE_SET2D_FIELDS INDEXED_FACE_SET2D_FIELD
				| INDEXED_FACE_SET2D_FIELDS INDEXED_FACE_SET2D_EXP_FIELD
				;

INDEXED_FACE_SET2D_EVENT:	  ef_color
				| ef_coord
				| ef_texCoord
				;

INDEXED_FACE_SET2D_EVENTIN:	  ei_set_colorIndex
				| ei_set_coordIndex
				| ei_set_texCoordIndex
				;

INDEXED_FACE_SET2D_EXP_FIELD:	  ef_color COLOR_NODE
				| ef_color error '}'
				{
				fprintf(stderr, "\t -> Color node expected\n");
				}
				| ef_coord COORDINATE2D_NODE
				| ef_coord error '}'
				{
				fprintf(stderr, "\t -> Coordinate node expected\n");
				}
				| ef_texCoord TEXTURE_COORDINATE_NODE
				| ef_texCoord error '}'
				{
				fprintf(stderr, "\t -> TextureCoordinate node expected\n");
				}
				;

INDEXED_FACE_SET2D_FIELD:	  f_colorIndex MF_NUMBER_DATA
				| f_colorPerVertex SF_BOOL_DATA
				| f_convex SF_BOOL_DATA
				| f_coordIndex MF_NUMBER_DATA
				| f_texCoordIndex MF_NUMBER_DATA
				;

/*******************************************************************/

INDEXED_LINE_SET2D_NODE:	  n_IndexedLineSet2D '{' INDEXED_LINE_SET2D_FIELDS '}'
				| n_IndexedLineSet2D '{' '}'
				{
				fprintf(stderr, "line %i: warning; empty node\n",line);
				}
				| kw_DEF kw_Identifier INDEXED_LINE_SET2D_NODE
				{
				push_node_data($<STR>2, $<INT>3);
				}
				| kw_USE n_IndexedLineSet2D
				;

INDEXED_LINE_SET2D_FIELDS:	  INDEXED_LINE_SET2D_FIELD
				| INDEXED_LINE_SET2D_EXP_FIELD
				| INDEXED_LINE_SET2D_FIELDS INDEXED_LINE_SET2D_FIELD
				| INDEXED_LINE_SET2D_FIELDS INDEXED_LINE_SET2D_EXP_FIELD
				;

INDEXED_LINE_SET2D_EVENT:	  ef_color
				| ef_coord
				;

INDEXED_LINE_SET2D_EVENTIN:	  ei_set_colorIndex
				| ei_set_coordIndex
				;

INDEXED_LINE_SET2D_EXP_FIELD:	  ef_color COLOR_NODE
				| ef_color error '}'
				{
				fprintf(stderr, "\t -> Color node expected\n");
				}
				| ef_coord COORDINATE2D_NODE
				| ef_coord error '}'
				{
				fprintf(stderr, "\t -> Coordinate2D node expected\n");
				}
				;

INDEXED_LINE_SET2D_FIELD:	  f_colorIndex MF_NUMBER_DATA
				| f_colorPerVertex SF_BOOL_DATA
				| f_coordIndex MF_NUMBER_DATA
				;

/*******************************************************************/

INLINE2D_NODE:	  n_Inline2D '{' INLINE2D_FIELDS '}'
		| n_Inline2D '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier INLINE2D_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Inline2D
		;

INLINE2D_FIELDS:	  INLINE2D_FIELD
			| INLINE2D_EXP_FIELD
			| INLINE2D_FIELDS INLINE2D_FIELD
			| INLINE2D_FIELDS INLINE2D_EXP_FIELD
			;

INLINE2D_EVENT:	  ef_url
		;

INLINE2D_EXP_FIELD:	  ef_url skw_url 
			{
			push_node_data( $<STR>2, $<INT>2 )
			}
			;

INLINE2D_FIELD:	  f_bboxCenter SF_VEC3F_DATA
		| f_bboxSize SF_VEC3F_DATA
		;

/********************************************************************/

INTERPOLATOR_FIELDS:	  INTERPOLATOR_EXP_FIELD
			| INTERPOLATOR_FIELDS INTERPOLATOR_EXP_FIELD
			;

INTERPOLATOR_EVENT:	  ef_key
			| ef_keyValue
			;

INTERPOLATOR_EVENTIN:	  ei_set_fraction
			;

INTERPOLATOR_EXP_FIELD:	  ef_key MF_NUMBER_DATA
			| ef_keyValue MF_VEC3F_DATA
			;

INTERPOLATOR_EVENTOUT:	  eo_value_changed
			;

/********************************************************************/

LAYOUT_NODE:	  n_Layout '{' LAYOUT_FIELDS '}'
		| n_Layout '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier LAYOUT_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Layout
		;

LAYOUT_FIELDS:	  LAYOUT_EXP_FIELD
		| LAYOUT_FIELDS LAYOUT_EXP_FIELD
		;

LAYOUT_EVENT:	  ef_children
		| ef_wrap
		| ef_size
		| ef_horizontal
		| ef_justify
		| ef_leftToRight
		| ef_topToBottom
		| ef_spacing
		| ef_smothScroll
		| ef_loop
		| ef_scrollVertical
		| ef_scrollRate
		;

LAYOUT_EVENTIN:	  ei_addChildren MF_NODE
		| ei_addChildren error ']'
		{
		fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable expected\n");
		}
		| ei_removeChildren MF_NODE
		| ei_removeChildren error ']'
		{
		fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable expected\n");
		}
		;

LAYOUT_EXP_FIELD:	  ef_children MF_NODE
			| ef_children error ']'
			{
			fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable expected\n");
			}
			| ef_wrap SF_BOOL_DATA
			| ef_size SF_VEC2F_DATA
			| ef_horizontal SF_BOOL_DATA
			| ef_justify MF_STRING_DATA
			| ef_leftToRight SF_BOOL_DATA
			| ef_topToBottom SF_BOOL_DATA
			| ef_spacing SF_NUMBER_DATA
			| ef_smothScroll SF_BOOL_DATA
			| ef_loop SF_BOOL_DATA
			| ef_scrollVertical SF_BOOL_DATA
			| ef_scrollRate SF_NUMBER_DATA
			;

/*******************************************************************/

LINE_PROPERTIES_NODE:	  n_LineProperties '{' LINE_PROPERTIES_FIELDS '}'
			| n_LineProperties '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier LINE_PROPERTIES_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_LineProperties
			;

LINE_PROPERTIES_FIELDS:	  LINE_PROPERTIES_EXP_FIELD
			| LINE_PROPERTIES_FIELDS LINE_PROPERTIES_EXP_FIELD
			;

LINE_PROPERTIES_EVENT:	  ef_lineColor
			| ef_lineStyle
			| ef_width
			;

LINE_PROPERTIES_EXP_FIELD:	  ef_lineColor SF_VEC3F_DATA
				| ef_lineStyle SF_NUMBER_DATA
				| ef_width SF_NUMBER_DATA
				;

/*******************************************************************/
			
MATERIAL2D_NODE:	  n_Material2D '{' MATERIAL2D_FIELDS '}'
			| n_Material2D '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier MATERIAL2D_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_Material2D
			;

MATERIAL2D_FIELDS:	  MATERIAL2D_EXP_FIELD
			| MATERIAL2D_FIELDS MATERIAL2D_EXP_FIELD
			;

MATERIAL2D_EVENT:	  ef_emissiveColor
			| ef_filled
			| ef_lineProps
			| ef_transparency
			;

MATERIAL2D_EXP_FIELD:	  ef_emissiveColor SF_VEC3F_DATA
			| ef_filled SF_BOOL_DATA
			| ef_lineProps LINE_PROPERTIES_NODE
			| ef_lineProps error '}'
			{
			fprintf(stderr, "\t -> LineProperties node expected\n");
			}
			| ef_transparency SF_NUMBER_DATA
			;

/*******************************************************************/

MOVIE_TEXTURE_NODE:	  n_MovieTexture '{' MOVIE_TEXTURE_FIELDS '}'
			| n_MovieTexture '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier MOVIE_TEXTURE_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_MovieTexture
			;

MOVIE_TEXTURE_FIELDS:	  MOVIE_TEXTURE_FIELD
			| MOVIE_TEXTURE_EXP_FIELD
			| MOVIE_TEXTURE_FIELDS MOVIE_TEXTURE_FIELD
			| MOVIE_TEXTURE_FIELDS MOVIE_TEXTURE_EXP_FIELD
			;

MOVIE_TEXTURE_EVENT:	  ef_loop
			| ef_speed
			| ef_startTime
			| ef_stopTime
			| ef_url
			;

MOVIE_TEXTURE_EXP_FIELD:	  ef_loop SF_BOOL_DATA
				| ef_speed SF_NUMBER_DATA
				| ef_startTime SF_NUMBER_DATA
				| ef_stopTime SF_NUMBER_DATA
				| ef_url skw_url
			 	{
				push_node_data( $<STR>2, $<INT>2 )
				}
				;

MOVIE_TEXTURE_FIELD:	  f_repeatS SF_BOOL_DATA
			| f_repeatT SF_BOOL_DATA
			;

MOVIE_TEXTURE_EVENTOUT:	  eo_duration_changed
			| eo_isActive
			;

/*******************************************************************/

POINT_SET2D_NODE:	  n_PointSet2D '{' POINT_SET2D_NODE '}'
			| n_PointSet2D '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier POINT_SET2D_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_PointSet2D
			;

POINT_SET2D_FIELDS:	  POINT_SET2D_EXP_FIELD
			| POINT_SET2D_FIELDS POINT_SET2D_EXP_FIELD
			;

POINT_SET2D_EVENT:	  ef_color
			| ef_coord
			;

POINT_SET2D_EXP_FIELD:	  ef_color COLOR_NODE
			| ef_color error '}'
			{
			fprintf(stderr, "\t -> Color node expected\n");
			}
			| ef_coord COORDINATE2D_NODE
			| ef_coord error '}'
			{
			fprintf(stderr, "\t -> Coordinate node expected\n");
			}
			;

/*******************************************************************/

POSITION2D_INTERPOLATOR_NODE:	  n_Position2DInterpolator '{' INTERPOLATOR_FIELDS '}'
				| n_Position2DInterpolator '{' '}'
				{
				fprintf(stderr, "line %i: warning; empty node\n",line);
				}
				| kw_DEF kw_Identifier POSITION2D_INTERPOLATOR_NODE
				{
				push_node_data($<STR>2, $<INT>3);
				}
				| kw_USE n_Position2DInterpolator
				;

/*******************************************************************/

RECTANGLE_NODE:	  n_Rectangle '{' RECTANGLE_EXP_FIELD '}'
		| n_Rectangle '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier RECTANGLE_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Rectangle
		;

RECTANGLE_EVENT:	  ef_size
			;

RECTANGLE_EXP_FIELD:	  ef_size SF_VEC2F_DATA
			;

/*******************************************************************/

SCALAR_INTERPOLATOR_NODE:	  n_ScalarInterpolator '{' INTERPOLATOR_FIELDS '}'
				| n_ScalarInterpolator '{' '}'
				{
				fprintf(stderr, "line %i: warning; empty node\n",line);
				}
				| kw_DEF kw_Identifier SCALAR_INTERPOLATOR_NODE
				{
				push_node_data($<STR>2, $<INT>3);
				}
				| kw_USE n_ScalarInterpolator
				;

SCALAR_INTERPOLATOR_FIELDS:	  SCALAR_INTERPOLATOR_EXP_FIELD
				| SCALAR_INTERPOLATOR_FIELDS INTERPOLATOR_EXP_FIELD
				;

SCALAR_INTERPOLATOR_EVENT:	  ef_key
				| ef_keyValue
				;

SCALAR_INTERPOLATOR_EXP_FIELD:	  ef_key MF_NUMBER_DATA
				| ef_keyValue MF_NUMBER_DATA
				;

/*******************************************************************/

SHAPE_NODE:	  n_Shape '{' SHAPE_FIELDS '}'
		| n_Shape '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier SHAPE_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Shape
		;

SHAPE_FIELDS:	  SHAPE_EXP_FIELD
		| SHAPE_FIELDS SHAPE_EXP_FIELD
		;

SHAPE_EVENT:	  ef_appearance
		| ef_geometry
		;

SHAPE_EXP_FIELD:	  ef_appearance APPEARANCE_NODE
			| ef_appearance	error '}'
			{
			fprintf(stderr, "\t -> Appearance node expected\n");
			}
			| ef_geometry SF_GEOMETRY_NODE
			| ef_geometry error '}'
			{
			fprintf(stderr, "\t -> geometry node expected\n");
			}
			;

/*******************************************************************/

SOUND2D_NODE:	  n_Sound2D '{' SOUND2D_FIELDS '}'
		| n_Sound2D '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier SOUND2D_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Sound2D
		;

SOUND2D_FIELDS:	  SOUND2D_FIELD
		| SOUND2D_EXP_FIELD
		| SOUND2D_FIELDS SOUND2D_FIELD
		| SOUND2D_FIELDS SOUND2D_EXP_FIELD
		;

SOUND2D_EVENT:	  ef_intensity
		| ef_location
		| ef_source
		;

SOUND2D_EXP_FIELD:	  ef_intensity SF_NUMBER_DATA
			| ef_location SF_VEC2F_DATA
			| ef_source AUDIO_SOURCE_NODE
			| ef_source error '}'
			{
			fprintf(stderr, "\t -> AudioSource node expected\n");
			}
			;

SOUND2D_FIELD:	  f_spatialize SF_BOOL_DATA
		;

/*******************************************************************/

SPHERE_NODE:	  n_Sphere '{' SPHERE_EXP_FIELD '}'
		| n_Sphere '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier SPHERE_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Sphere
		;

SPHERE_EVENT:	  ef_radius
		;

SPHERE_EXP_FIELD:	  ef_radius SF_NUMBER_DATA
			;

/********************************************************************/

SWITCH2D_NODE:	  n_Switch2D '{' SWITCH2D_FIELDS '}'
		| n_Switch2D '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier SWITCH2D_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Switch2D
		;
		
SWITCH2D_FIELDS:	  SWITCH2D_EXP_FIELD
			| SWITCH2D_FIELDS SWITCH2D_EXP_FIELD
			;

SWITCH2D_EVENT:	  ef_choice
		| ef_wichChoice
		;

SWITCH2D_EXP_FIELD:	  ef_choice MF_NODE
			| ef_choice error ']'
			{
			fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable node expected\n");
			}
			| ef_wichChoice SF_NUMBER_DATA
			;

/*******************************************************************/

TEXT_NODE:	  n_Text '{' TEXT_FIELDS '}'
		| n_Text '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier TEXT_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Text
		;

TEXT_FIELDS:	  TEXT_EXP_FIELD
		| TEXT_FIELDS TEXT_EXP_FIELD
		;

TEXT_EVENT:	  ef_string
		| ef_fontStyle
		| ef_length
		| ef_maxExtent
		;

TEXT_EXP_FIELD:	  ef_string MF_STRING_DATA
		| ef_fontStyle FONT_STYLE_NODE
		| ef_fontStyle error '}'
		{
		fprintf(stderr, "\t -> FontStyle node expected\n");
		}
		| ef_length MF_NUMBER_DATA
		| ef_maxExtent SF_NUMBER_DATA
		;

/*******************************************************************/

TEXTURE_COORDINATE_NODE:	  n_TextureCoordinate '{' TEXTURE_COORDINATE_EXP_FIELD '}'
				| n_TextureCoordinate '{' '}'
				{
				fprintf(stderr, "line %i: warning; empty node\n",line);
				}
				| kw_DEF kw_Identifier TEXTURE_COORDINATE_NODE
				{
				push_node_data($<STR>2, $<INT>3);
				}
				| kw_USE n_TextureCoordinate
				;

TEXTURE_COORDINATE_EVENT:	  ef_point
				;

TEXTURE_COORDINATE_EXP_FIELD:	  ef_point MF_VEC2F_DATA
				;

/*******************************************************************/

TEXTURE_TRANSFORM_NODE:	  n_TextureTransform '{' TEXTURE_TRANSFORM_FIELDS '}'
			| n_TextureTransform '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier TEXTURE_TRANSFORM_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_TextureTransform
			;

TEXTURE_TRANSFORM_FIELDS:	  TEXTURE_TRANSFORM_EXP_FIELD
				| TEXTURE_TRANSFORM_FIELDS TEXTURE_TRANSFORM_EXP_FIELD
				;

TEXTURE_TRANSFORM_EVENT:	  ef_center
				| ef_rotation
				| ef_scale
				| ef_translation
				;

TEXTURE_TRANSFORM_EXP_FIELD:	  ef_center SF_VEC2F_DATA
				| ef_rotation SF_NUMBER_DATA
				| ef_scale SF_VEC2F_DATA
				| ef_translation SF_VEC2F_DATA
				;

/*******************************************************************/

TIME_SENSOR_NODE:	  n_TimeSensor '{' TIME_SENSOR_FIELDS '}'
			| n_TimeSensor '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier TIME_SENSOR_NODE
			{
				push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_TimeSensor
			;

TIME_SENSOR_FIELDS:	  TIME_SENSOR_EXP_FIELD
			| TIME_SENSOR_FIELDS TIME_SENSOR_EXP_FIELD
			;

TIME_SENSOR_EVENT:	  ef_cycleInterval
			| ef_enabled
			| ef_loop
			| ef_startTime
			| ef_stopTime
			;

TIME_SENSOR_EXP_FIELD:	  ef_cycleInterval SF_NUMBER_DATA
			| ef_enabled SF_BOOL_DATA
			| ef_loop SF_BOOL_DATA
			| ef_startTime SF_NUMBER_DATA
			| ef_stopTime SF_NUMBER_DATA
			;

TIME_SENSOR_EVENTOUT:	  eo_cycleTime
			| eo_fraction_changed
			| eo_isActive
			| eo_time
			;

/*******************************************************************/

TOUCH_SENSOR_NODE:	  n_TouchSensor '{' TOUCH_SENSOR_EXP_FIELD '}'
			| n_TouchSensor '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier TOUCH_SENSOR_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_TouchSensor
			;

TOUCH_SENSOR_EVENT:	  ef_enabled
			;

TOUCH_SENSOR_EXP_FIELD:	  ef_enabled SF_BOOL_DATA
			;

TOUCH_SENSOR_EVENTOUT:	  eo_hitNormal_changed
			| eo_hitPoint_changed
			| eo_hitTexCoord_changed
			| eo_isActive
			| eo_isOver
			| eo_touchTime
			;

/*******************************************************************/

TRANSFORM2D_NODE:	  n_Transform2D '{' TRANSFORM2D_FIELDS '}'
			| n_Transform2D '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier TRANSFORM2D_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_Transform2D
			;

TRANSFORM2D_FIELDS:	  TRANSFORM2D_EXP_FIELD
			| TRANSFORM2D_FIELDS TRANSFORM2D_EXP_FIELD
			;

TRANSFORM2D_EVENT:	  ef_center
			| ef_children
			| ef_drawingOrder
			| ef_rotationAngle
			| ef_scale
			| ef_scaleOrientation
			| ef_translation
			;

TRANSFORM2D_EVENTIN:	  ei_addChildren MF_NODE
			| ei_addChildren error ']'
			{
			fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable node expected\n");
			}
			| ei_removeChildren MF_NODE
			| ei_removeChildren error ']'
			{
			fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable node expected\n");
			}
			;

TRANSFORM2D_EXP_FIELD:	  ef_center SF_VEC2F_DATA
			| ef_children MF_NODE
			| ef_children error ']'
			{
			fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable node expected\n");
			}
			| ef_drawingOrder SF_NUMBER_DATA
			| ef_rotationAngle SF_NUMBER_DATA
			| ef_scale SF_VEC2F_DATA
			| ef_scaleOrientation SF_ROTATION_DATA
			| ef_translation SF_VEC2F_DATA
			;

TRANSFORM2D_FIELD:	  f_bboxCenter SF_VEC2F_DATA
			| f_bboxSize SF_VEC2F_DATA
			;

/*******************************************************************/

WORLD_INFO_NODE:	  n_WorldInfo '{' WORLD_INFO_FIELDS '}'
			| n_WorldInfo '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier WORLD_INFO_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_WorldInfo
			;

WORLD_INFO_FIELDS:	  WORLD_INFO_FIELD
			| WORLD_INFO_FIELDS WORLD_INFO_FIELD
			;

WORLD_INFO_FIELD:	  f_info MF_STRING_DATA
			| f_title d_String
			;

/****************** Data Types *************************************/

SF_BOOL_DATA:	  d_TRUE
		| d_FALSE
		;

/*******************************************************************/

SF_NUMBER_DATA:	  d_Number
		| SF_NUMBER_DATA d_Number
		{
		fprintf(stderr, "\t error occured before \"%s\" -> SF_NUMBER expected \n", yytext);
		} 
		;

/*******************************************************************/

SF_ROTATION_DATA:	  d_Number d_Number d_Number d_Number
			| SF_ROTATION_DATA d_Number
			{
			yyerror();
			yyerrok;
			yyclearin;
			fprintf(stderr, "\t -> SF_ROTATION expected \n");
			}
			| d_Number d_Number d_Number error
			{
			fprintf(stderr, "\t error occured before \"%s\" -> SF_ROTATION expected \n", yytext);
			}
			;

/*******************************************************************/

SF_VEC2F_DATA: 	  d_Number d_Number
		| SF_VEC2F_DATA d_Number
		{
		yyerror();
		yyerrok;
		yyclearin;
		fprintf(stderr, "\t -> SF_VEC2F expected \n");
		}
		| d_Number error
		{
		fprintf(stderr, "\t error occured before \"%s\" -> SF_VEC2F expected \n", yytext);
		}
		;

/*******************************************************************/

SF_VEC3F_DATA:	  d_Number d_Number d_Number
		| SF_VEC3F_DATA d_Number
		{
		yyerror();
		yyerrok;
		yyclearin;
		fprintf(stderr, "\t -> SF_VEC3F expected \n");
		}
		| d_Number d_Number error
		{
		fprintf(stderr, "\t error occured before \"%s\" -> SF_VEC3F expected \n", yytext);
		}
		;

/*******************************************************************/

MF_NUMBER_DATA:	  '[' MANY_NUMBER_DATA ']'
		| '[' MANY_NUMBER_DATA ',' ']'
		| '[' MANY_NUMBER_DATA error ']'
		{
		fprintf(stderr, "\t error occured before \"%s\" -> its not a valid MF_NUMBER field \n", yytext);
		}
		;

MANY_NUMBER_DATA:	  d_Number
			| MANY_NUMBER_DATA ',' d_Number
			;

/*******************************************************************/

MF_ROTATION_DATA:	  '[' MANY_MF_ROTATION ']'
			| '[' MANY_MF_ROTATION ',' ']'
			| '[' MANY_MF_ROTATION error ']'
			{
			fprintf(stderr, "\t error occured before \"%s\" -> its not a valid MF_ROTATION field \n", yytext);
			}
			;

MANY_MF_ROTATION: 	  d_Number d_Number d_Number d_Number
			| MANY_MF_ROTATION ','  d_Number d_Number d_Number d_Number 
			;

/*******************************************************************/

MF_VEC2F_DATA:	  '[' MANY_MF_VEC2F_DATA ']'
		| '[' MANY_MF_VEC2F_DATA ',' ']'
		| '[' MANY_MF_VEC2F_DATA error ']'
		{
		fprintf(stderr, "\t error occured before \"%s\" -> its not a valid MF_VEC2F field \n", yytext);
		}
		;

MANY_MF_VEC2F_DATA:	  d_Number d_Number
			| MANY_MF_VEC2F_DATA ',' d_Number d_Number
			;

/*******************************************************************/

MF_VEC3F_DATA:	  '[' MANY_MF_VEC3F_DATA ']'
		| '[' MANY_MF_VEC3F_DATA ',' ']'
		| '[' MANY_MF_VEC3F_DATA error ']'
		{
		fprintf(stderr, "\t error occured before \"%s\" -> its not a valid MF_VEC3F field \n", yytext);
		}
		;

MANY_MF_VEC3F_DATA:	  d_Number d_Number d_Number
			| MANY_MF_VEC3F_DATA ',' d_Number d_Number d_Number
			;

/*******************************************************************/

/*********************************************************************
*
*	The definition of MF_STRING_DATA is very sloppy just like the
*	the use of them in the scene description.
*
*********************************************************************/

MF_STRING_DATA:	  '[' MANY_STRING_DATA ']'
		| '[' MANY_STRING_DATA ',' ']'
		| d_String
		;

MANY_STRING_DATA:	  d_String
			| MANY_STRING_DATA ',' d_String
			;

/*******************************************************************/

FIELD_VALUE:	  SF_FIELD_VALUE
		| MF_FIELD_VALUE
		;

/*******************************************************************/

SF_FIELD_VALUE:	  SF_BOOL_DATA
		| SF_NUMBER_DATA
		| SF_ROTATION_DATA
		| SF_VEC2F_DATA
		| SF_VEC3F_DATA
		;

/*******************************************************************/

MF_FIELD_VALUE:	  MF_NUMBER_DATA
		| MF_ROTATION_DATA
		| MF_VEC2F_DATA
		| MF_VEC3F_DATA
		;

/*********************************************************************
*********************************************************************/


/******************* Object descriptor *****************************/

OBJECT_DESCRIPTORS:	  OBJECT_DESCRIPTOR 
			| OBJECT_DESCRIPTORS OBJECT_DESCRIPTOR 
			;

/*******************************************************************/

OBJECT_DESCRIPTOR:	  '{' OBJECT_DESCRIPTOR_FIELDS '}'
			;
	
OBJECT_DESCRIPTOR_FIELDS:	  OBJECT_DESCRIPTOR_FIELD
				| OBJECT_DESCRIPTOR_FIELDS OBJECT_DESCRIPTOR_FIELD
				;

OBJECT_DESCRIPTOR_FIELD:	  od_objectDescriptorID SF_NUMBER_DATA
				| od_es_descriptor ES_DESCRIPTOR
				| od_extensionDescriptor EXTENSION_DESCRIPTOR
				;

/*******************************************************************/

ES_DESCRIPTOR:	  '{' ES_DESCRIPTOR_FIELDS '}'
		;

ES_DESCRIPTOR_FIELDS:	  ES_DESCRIPTOR_FIELD
			| ES_DESCRIPTOR_FIELDS ES_DESCRIPTOR_FIELD
			;

ES_DESCRIPTOR_FIELD:	  od_es_Number SF_NUMBER_DATA
			| ef_url skw_url
			| od_remoteODflag SF_BOOL_DATA
			| od_dependsOn_ES_number SF_NUMBER_DATA
			| od_decConfigDescr DECODER_CONFIG_DESCRIPTOR
			| od_alConfigDescr AL_CONFIG_DESCRIPTOR
			| od_ipiDescr IPI_DESCRIPTOR
			| od_qosDescr QOS_DESCRIPTOR
			| od_extensionDescriptor EXTENSION_DESCRIPTOR
		// not scecified in documentation of BifsEnc
			| od_fileName d_String
			| od_streamData SF_NUMBER_DATA
			;

/*******************************************************************/

DECODER_CONFIG_DESCRIPTOR:	  '{' DECODER_CONFIG_DESCRIPTOR_FIELDS '}'
				;

DECODER_CONFIG_DESCRIPTOR_FIELDS:	  DECODER_CONFIG_DESCRIPTOR_FIELD
					| DECODER_CONFIG_DESCRIPTOR_FIELDS DECODER_CONFIG_DESCRIPTOR_FIELD
					;

DECODER_CONFIG_DESCRIPTOR_FIELD:	  od_profileAndLevelIndication SF_NUMBER_DATA
					| od_streamType SF_NUMBER_DATA
					| od_upStream SF_BOOL_DATA
					| od_bufferSizeDB SF_NUMBER_DATA
					| od_maxBitrate SF_NUMBER_DATA
					| od_avgBitrate SF_NUMBER_DATA
					| od_specificInfo d_String
					;

IPI_DESCRIPTOR:	  '{' IPI_DESCRIPTOR_FIELDS '}'
		;

IPI_DESCRIPTOR_FIELDS:	  IPI_DESCRIPTOR_FIELD
			| IPI_DESCRIPTOR_FIELDS IPI_DESCRIPTOR_FIELD
			;

IPI_DESCRIPTOR_FIELD:	  od_IPI_ES_Id SF_NUMBER_DATA
			| od_IP_IDSs IP_INFORMATION_DATA_SET
			;

/*******************************************************************/

IP_INFORMATION_DATA_SET:	  '{' IP_INFORMATION_DATA_SET_FIELDS '}'
				;

IP_INFORMATION_DATA_SET_FIELDS:	  IP_INFORMATION_DATA_SET_FIELD
				| IP_INFORMATION_DATA_SET_FIELDS IP_INFORMATION_DATA_SET_FIELD
				;

IP_INFORMATION_DATA_SET_FIELD:	  od_compatibility SF_NUMBER_DATA
				| od_type_of_content SF_NUMBER_DATA
				| od_type_of_content_identifier SF_NUMBER_DATA
				| od_content_identifier d_String
				| od_supplementaryContentIdentifier SUPPLEMENTARY_CONTENT_IDENTIFIER
				| od_language_code SF_NUMBER_DATA
				;

/*******************************************************************/

SUPPLEMENTARY_CONTENT_IDENTIFIER:	  '{' SUPPLEMENTARY_CONTENT_IDENTIFIER_FIELDS '}'
					;

SUPPLEMENTARY_CONTENT_IDENTIFIER_FIELDS:	  SUPPLEMENTARY_CONTENT_IDENTIFIER_FIELD
						| SUPPLEMENTARY_CONTENT_IDENTIFIER_FIELDS SUPPLEMENTARY_CONTENT_IDENTIFIER_FIELDS
						;

SUPPLEMENTARY_CONTENT_IDENTIFIER_FIELD:	  f_title d_String
					| od_value d_String
					;

/*******************************************************************/

QOS_DESCRIPTOR:	  '{' QOS_DESCRIPTOR_FIELDS '}'
		;

QOS_DESCRIPTOR_FIELDS:	  QOS_DESCRIPTOR_FIELD
			| QOS_DESCRIPTOR_FIELDS QOS_DESCRIPTOR_FIELD
			;

QOS_DESCRIPTOR_FIELD:	  od_streamPriority SF_NUMBER_DATA
			| od_predefined SF_NUMBER_DATA
			| od_QoS_Qualifier MF_STRING_DATA
			;

/*******************************************************************/

EXTENSION_DESCRIPTOR:	  '{' EXTENSION_DESCRIPTOR_FIELDS '}'
			;

EXTENSION_DESCRIPTOR_FIELDS:	  EXTENSION_DESCRIPTOR_FIELD
				| EXTENSION_DESCRIPTOR_FIELDS EXTENSION_DESCRIPTOR_FIELD
				;

EXTENSION_DESCRIPTOR_FIELD:	  od_descriptorTag SF_NUMBER_DATA
				| od_descriptorData d_String
				;

/*******************************************************************/

AL_CONFIG_DESCRIPTOR:	  '{' AL_CONFIG_DESCRIPTOR_FIELDS '}'
			;

AL_CONFIG_DESCRIPTOR_FIELDS:	  AL_CONFIG_DESCRIPTOR_FIELD
				| AL_CONFIG_DESCRIPTOR_FIELDS AL_CONFIG_DESCRIPTOR_FIELD
				;

AL_CONFIG_DESCRIPTOR_FIELD:	  od_predefined SF_NUMBER_DATA
				| od_useAccessUnitStartFlag SF_BOOL_DATA
				| od_useAccessUnitEndFlag SF_BOOL_DATA
				| od_useRandomAccessPointFlag SF_BOOL_DATA
				| od_usePaddingFlag SF_BOOL_DATA
				| od_useTimeStampsFlag SF_BOOL_DATA
				| od_timeStampResolution SF_NUMBER_DATA
				| od_OCRResolution SF_NUMBER_DATA
				| od_timeStampLength SF_NUMBER_DATA
				| od_OCRLength SF_NUMBER_DATA
				| od_useWallClockTimeStampFlag SF_BOOL_DATA
				| od_accessUnitRate SF_NUMBER_DATA
				| od_compositionUnitRate SF_NUMBER_DATA
				| od_startDecodingTimeStamp SF_NUMBER_DATA
				| od_startCompositionTimeStamp SF_NUMBER_DATA
				| od_wallClockTimeStamp SF_VEC3F_DATA
				| od_AU_Length SF_NUMBER_DATA
				| od_instantBitrateLength SF_NUMBER_DATA
				| od_degradationPriorityLength SF_NUMBER_DATA
				| od_seqNumLength SF_NUMBER_DATA
				| od_OCR_ES_Id SF_NUMBER_DATA
				;

%%

int zzerror ()
{
fprintf (stderr, "line %i: syntax error; \"%s\" unexpected in this context\n" , line, zztext);
return 0;
}
