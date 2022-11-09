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
//  group.y
//  Created by Nico Petri on 12.06.2000.

/*********************************************************************
*
*	This is the grammar file for parsing 3D scenes. All nonter-
*	minals are written in big letters. Terminals starts with an
*	expressiveness prefix:
*	- n 	-> Node
*	- ef 	-> ExposedField
*	- f	-> Field
*	- d	-> Data
*	- eo	-> EventOut
*	- ei	-> EventIn
*	- od	-> ObjectDescriptor
*	- kw	-> Keywords
*	- skw	-> Special keywords; see declaration for more details
*
*	All lexical elements are scanned by the lexical funktion that
*	is build by flex. Except of some symbols like braces. These
*	symbols are scanned by the lex()-funktion, but is returnd as
*	is. They are not converted in internal representions. So in
*	this way they improved the readability of the grammar file.
*
*********************************************************************/

%{
#include <stdlib.h>
#include "../clang/header/node_table.h"
#include "../clang/header/shared_dec.h"
extern int yylex();
extern int yyerror();
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

%token	n_Group
%token	n_WorldInfo

/****************** Nodes ******************************************/

%token	n_Anchor
%token	n_AnimationStream
%token	n_Appearance
%token	n_AudioDelay
%token	n_AudioFX
%token	n_AudioMix
%token	n_AudioSource
%token	n_AudioSwitch
%token	n_Background
%token	n_Box
%token	n_Circle
%token	n_Color
%token	n_ColorInterpolator
%token	n_Conditional
%token	n_Cone
%token	n_Coordinate
%token	n_CoordinateInterpolator
%token	n_Cylinder
%token	n_DirectionalLight
%token	n_DiscSensor
%token	n_Expression
%token	n_Face
%token	n_FaceDefMesh
%token	n_FaceDefTables
%token	n_FaceDefTransform
%token	n_FAP
%token	n_FDP
%token	n_Fog
%token	n_FontStyle
%token	n_Form
%token	n_ImageTexture
%token	n_IndexedFaceSet
%token	n_IndexedLineSet
%token	n_Inline
%token	n_Layout
%token	n_LOD
%token	n_Material
%token	n_MovieTexture
%token	n_Normal
%token	n_NormalInterpolator
%token	n_OrientationInterpolator
%token	n_PlaneSensor
%token	n_PointLight
%token	n_PointSet
%token	n_PositionInterpolator
%token	n_Rectangle
%token	n_ScalarInterpolator
%token	n_Shape
%token	n_Sound
%token	n_Sphere
%token	n_SpotLight
%token	n_Switch
%token	n_Text
%token	n_TextureCoordinate
%token	n_TextureTransform
%token	n_TimeSensor
%token	n_TouchSensor
%token	n_Transform
%token	n_Viewpoint
%token	n_Viseme

/****************** Fields *****************************************/

%token	ef_ambientIntensity
%token	ef_appearance
%token	ef_attenuation
%token	ef_autoOffset
%token	ef_backURL
%token	ef_beamWidth
%token	ef_bottomURL
%token	ef_buffer
%token	ef_center
%token	ef_children
%token	ef_choice
%token	ef_color
%token	ef_coord
%token	ef_constraint
%token	ef_cutOffAngle
%token	ef_cycleInterval
%token	ef_delay
%token	ef_description
%token	ef_diffuseColor
%token	ef_direction
%token	ef_emissiveColor
%token	ef_enabled
%token	ef_fieldOfView
%token	ef_fogType
%token	ef_fontStyle
%token	ef_frontURL
%token	ef_geometry
%token	ef_groundAngle
%token	ef_groundColor
%token	ef_groups
%token	ef_groupsIndex
%token	ef_intensity
%token	ef_horizontal
%token	ef_jump
%token	ef_justify
%token	ef_key
%token	ef_keyValue
%token	ef_leftToRight
%token	ef_leftURL
%token	ef_length
%token	ef_level
%token	ef_location
%token	ef_loop
%token	ef_material
%token	ef_matrix
%token	ef_maxAngle
%token	ef_maxBack
%token	ef_maxExtent
%token	ef_maxFront
%token	ef_maxPosition
%token	ef_minAngle
%token	ef_minBack
%token	ef_minFront
%token	ef_minPosition
%token	ef_numInputs
%token	ef_normal
%token	ef_offset
%token	ef_on
%token	ef_orch
%token	ef_orientation
%token	ef_parameter
%token	ef_params
%token	ef_pitch
%token	ef_point
%token	ef_position
%token	ef_priority
%token	ef_radius
%token	ef_rightURL
%token	ef_rotation
%token	ef_scale
%token	ef_scaleOrientation
%token 	ef_score
%token	ef_scrollRate
%token	ef_scrollVertical
%token	ef_shininess
%token	ef_size
%token	ef_skyAngle
%token	ef_skyColor
%token	ef_smothScroll
%token	ef_source
%token	ef_spacing
%token	ef_speed
%token	ef_specularColor
%token	ef_startTime
%token	ef_stopTime
%token	ef_string
%token	ef_texCoord
%token	ef_texture
%token	ef_textureTransform
%token	ef_translation
%token	ef_transparency
%token	ef_topToBottom
%token	ef_topURL
%token	ef_url
%token	ef_vector
%token	ef_visibilityRange
%token	ef_wichChoice
%token	ef_wrap

%token	f_bboxCenter
%token	f_bboxSize
%token	f_bottom
%token	f_bottomRadius
%token	f_ccw
//	f_center == ef_center
%token	f_colorIndex
%token	f_colorPerVertex
%token	f_convex
%token 	f_coordIndex
%token	f_creaseAngle
//	f_description == ef_description
%token 	f_expression_def
%token	f_expression_intensity1
%token	f_expression_intensity2
%token	f_expression_select1
%token	f_expression_select2
%token	f_family
%token	f_height
//	f_horizontal == ef_horizontal
%token	f_info
%token	f_init_face
//	f_justify == ef_justify
%token	f_language
//	f_leftToRight == ef_leftToRight
%token	f_normalIndex
%token	f_normalPerVertex
%token	f_numChan
%token	f_phaseGroup
//	f_radius == ef_radius
%token	f_range
%token	f_repeatS
%token	f_repeatT
%token	f_side
//	f_size == ef_size
%token	f_solid
//	f_spacing == ef_spacing
%token	f_spatialize
%token	f_style
%token	f_texCoordIndex
%token	f_title
%token	f_top
//	f_topToBottom == ef_topToBottom
%token	f_viseme_select1
%token	f_viseme_select2
%token	f_viseme_blend
%token	f_viseme_def


/****************** events ****************************************/


%token	ei_activate
%token	ei_addChildren
%token	ei_removeChildren
%token	ei_reverseActivate
%token	ei_set_bind
%token	ei_set_colorIndex
%token	ei_set_coordIndex
%token	ei_set_fraction
%token	ei_set_texCoordIndex
%token	ei_set_normalIndex
%token	ei_set_texCoordIndex


%token	eo_bindTime
%token	eo_cycleTime
%token	eo_duration_changed
%token	eo_fraction_changed
%token	eo_hitNormal_changed
%token	eo_hitPoint_changed
%token	eo_hitTexCoord_changed
%token	eo_isActive
%token	eo_isBound
%token	eo_isOver
%token	eo_rotation_changed
%token	eo_time
%token	eo_touchTime
%token	eo_trackPoint_changed
%token	eo_translation_changed
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

%token	skw_ROUTE_DEF
/* "ROUTE DEF"	*/


%token	skw_Route_Identifier	
/* this token is never used in rule; the push_node_data need a unused integer       for storing, so the pop_node_data can differ from other identifiers like node	  identifiers etc. */

%token	skw_unknown
/* every symbol that is not a lexical element	*/
%token	skw_url		
/* just like Route_Identifier		*/

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

/******************* Face *******************************************/

%token	ef_fit
%token	ef_fdp
%token	ef_fap
%token	ef_ttsSource
%token	ef_renderedFace

/******************* FaceDefMesh ************************************/

%token	f_faceSceneGraphNode
%token	f_intervalBorders
%token	f_displacements

/******************* FaceDefTables **********************************/

%token	f_fapID
%token	f_highLevelSelect
%token	ef_faceDefMesh
%token	ef_faceDefTransform

/******************* FaceDefTransform *******************************/

%token	f_fieldId
%token	f_rotationDef
%token	f_scaleDef
%token	f_translationDef

/******************* Fap ********************************************/

%token ef_viseme 
%token ef_expression 
%token ef_open_jaw 
%token ef_lower_t_midlip 
%token ef_raise_b_midlip 
%token ef_stretch_l_corner 
%token ef_stretch_r_corner 
%token ef_lower_t_lip_lm 
%token ef_lower_t_lip_rm 
%token ef_lower_b_lip_lm 
%token ef_lower_b_lip_rm 
%token ef_raise_l_cornerlip 
%token ef_raise_r_cornerlip 
%token ef_thrust_jaw 
%token ef_shift_jaw 
%token ef_push_b_lip 
%token ef_push_t_lip 
%token ef_depress_chin 
%token ef_close_t_l_eyelid 
%token ef_close_t_r_eyelid 
%token ef_close_b_l_eyelid 
%token ef_close_b_r_eyelid 
%token ef_yaw_l_eyeball 
%token ef_yaw_r_eyeball 
%token ef_pitch_l_eyeball 
%token ef_pitch_r_eyeball 
%token ef_thrust_l_eyeball 
%token ef_thrust_r_eyeball 
%token ef_dilate_l_pupil 
%token ef_dilate_r_pupil 
%token ef_raise_l_i_eyebrow 
%token ef_raise_r_i_eyebrow 
%token ef_raise_l_m_eyebrow 
%token ef_raise_r_m_eyebrow 
%token ef_raise_l_o_eyebrow 
%token ef_raise_r_o_eyebrow 
%token ef_sqeeze_l_eyebrow 
%token ef_sqeeze_r_eyebrow 
%token ef_puff_l_cheek 
%token ef_puff_r_cheek 
%token ef_lift_l_cheek 
%token ef_lift_r_cheek 
%token ef_shift_tongue_tip
%token ef_raise_tongue_tip 
%token ef_thrust_tongue_tip 
%token ef_raise_tongue
%token ef_tongue_roll 
%token ef_head_pitch 
%token ef_head_yaw 
%token ef_head_roll 
%token ef_lower_t_lip_lm_o 
%token ef_lower_t_lip_rm_o 
%token ef_raise_b_lip_lm_o 
%token ef_raise_b_lip_rm_o 
%token ef_raise_l_cornerlib_o 
%token ef_stretch_l_nose 
%token ef_stretch_r_nose 
%token ef_raise_nose 
%token ef_bend_nose 
%token ef_raise_l_ear 
%token ef_raise_r_ear 
%token ef_pull_l_ear 
%token ef_pull_r_ear 

/******************* FDP ********************************************/

%token	ef_featurePointsCoord
%token	ef_textureCoords
%token	ef_useOrthoTexture
%token	ef_faceDefTables
%token	ef_faceSceneGraph

/*********************************************************************
*********************************************************************/

%%
ALL:	  SCENE
	| ALL SCENE
	;

SCENE:	  GROUP_NODE
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
			| n_Background '.' BACKGROUND_EVENTOUT
			| n_ColorInterpolator '.'INTERPOLATOR_EVENTOUT
			| n_Conditional '.' CONDITIONAL_EVENTOUT
			| n_CoordinateInterpolator '.' INTERPOLATOR_EVENTOUT
			| n_DiscSensor '.' DISC_SENSOR_EVENTOUT
			| n_Fog '.' FOG_EVENTOUT
			| n_MovieTexture '.' MOVIE_TEXTURE_EVENTOUT
			| n_OrientationInterpolator '.' ORIENTATION_INTERPOLATOR_EVENTOUT
			| n_PlaneSensor '.' PLANE_SENSOR_EVENTOUT
			| n_TimeSensor '.' TIME_SENSOR_EVENTOUT
			| n_TouchSensor '.' TOUCH_SENSOR_EVENTOUT
			| n_Viewpoint '.' VIEWPOINT_EVENTOUT
			| EXP_FIELD_EVENTS
			;

ROUTE_TARGET_REF:	  n_AudioDelay '.' AUDIO_DELAY_EVENTIN
			| n_AudioFX '.' AUDIO_FX_EVENTIN
			| n_AudioMix '.' AUDIO_MIX_EVENTIN
			| n_AudioSource '.' AUDIO_SOURCE_EVENTIN
			| n_Background '.' BACKGROUND_EVENTIN
			| n_ColorInterpolator '.' INTERPOLATOR_EVENTIN
			| n_Conditional '.' CONDITIONAL_EVENTIN
			| n_CoordinateInterpolator '.' INTERPOLATOR_EVENTIN
			| n_Fog '.' FOG_EVENTIN
			| n_Form '.' FORM_EVENTIN
			| n_Group '.' GROUP_EVENTIN
			| n_IndexedFaceSet '.' INDEXED_FACE_SET_EVENTIN
			| n_IndexedLineSet '.' INDEXED_LINE_SET_EVENTIN
			| n_Layout '.' LAYOUT_EVENTIN
			| n_OrientationInterpolator '.' ORIENTATION_INTERPOLATOR_EVENTIN
			| n_Transform '.' TRANSFORM_EVENTIN
			| n_Viewpoint '.' VIEWPOINT_EVENTIN
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

EXP_FIELD_EVENTS:	  n_Anchor '.' ANCHOR_EVENT
			| n_Appearance '.' APPEARANCE_EVENT
			| n_AnimationStream '.' ANIMATION_STREAM_EVENT
			| n_AudioDelay '.' AUDIO_DELAY_EVENT
			| n_AudioFX '.' AUDIO_FX_EVENT
			| n_AudioMix '.' AUDIO_MIX_EVENT
			| n_AudioSource '.' AUDIO_SOURCE_EVENT
			| n_AudioSwitch '.' AUDIO_SWITCH_EVENT
			| n_Background '.' BACKGROUND_EVENT
			| n_Box '.' BOX_EVENT
			| n_Circle '.' CIRCLE_EVENT
			| n_Color '.' COLOR_EVENT
			| n_ColorInterpolator '.' INTERPOLATOR_EVENT
			| n_Conditional '.' CONDITIONAL_EVENT
			| n_Coordinate '.' COORDINATE_EVENT
			| n_CoordinateInterpolator '.' INTERPOLATOR_EVENT
			| n_DirectionalLight '.' DIRECTIONAL_LIGHT_EVENT
			| n_DiscSensor '.' DISC_SENSOR_EVENT
			| n_Face '.' FACE_EVENT
			| n_FaceDefTables '.' FACE_DEF_TABLES_EVENT
			| n_FDP '.' FDP_EVENT
			| n_Fog '.' FOG_EVENT
			| n_Form '.' FORM_EVENT
			| n_ImageTexture '.' IMAGE_TEXTURE_EVENT
			| n_IndexedFaceSet '.' INDEXED_FACE_SET_EVENT
			| n_IndexedLineSet '.' INDEXED_LINE_SET_EVENT
			| n_Inline '.' INLINE_EVENT
			| n_Layout '.' LAYOUT_EVENT
			| n_LOD '.' LOD_EVENT
			| n_Material '.' MATERIAL_EVENT
			| n_MovieTexture '.' MOVIE_TEXTURE_EVENT
			| n_Normal '.' NORMAL_EVENT
			| n_OrientationInterpolator '.' ORIENTATION_INTERPOLATOR_EVENT
			| n_PlaneSensor '.' PLANE_SENSOR_EVENT
			| n_PointLight '.' POINT_LIGHT_EVENT
			| n_PointSet '.' POINT_SET_EVENT
			| n_Rectangle '.' RECTANGLE_EVENT
			| n_ScalarInterpolator '.' SCALAR_INTERPOLATOR_EVENT
			| n_Shape '.' SHAPE_EVENT
			| n_Sound '.' SOUND_EVENT
			| n_Sphere '.' SPHERE_EVENT
			| n_SpotLight '.' SPOT_LIGHT_EVENT
			| n_Switch '.' SWITCH_EVENT
			| n_Text '.' TEXT_EVENT
			| n_TextureCoordinate '.' TEXTURE_COORDINATE_EVENT
			| n_TextureTransform '.' TEXTURE_TRANSFORM_EVENT
			| n_TimeSensor '.' TIME_SENSOR_EVENT
			| n_TouchSensor '.' TOUCH_SENSOR_EVENT
			| n_Transform '.' TRANSFORM_EVENT
			| n_Viewpoint '.' VIEWPOINT_EVENT
			;

/******************* reference for the updata commands***************/

/*********************************************************************
*
*	Look for the comment in the "exposedField Event" section for
*	more details about this nonterminal definition.
*
*********************************************************************/

UPDATE_COMMANDS_REF:	  n_Anchor '.' ANCHOR_EXP_FIELD
			| n_Appearance '.' APPEARANCE_EXP_FIELD
			| n_AudioDelay '.' AUDIO_DELAY_EXP_FIELD
			| n_AudioFX '.' AUDIO_FX_EXP_FIELD
			| n_AudioMix '.' AUDIO_MIX_EXP_FIELD
			| n_AudioSource '.' AUDIO_SOURCE_EXP_FIELD
			| n_AudioSwitch '.' AUDIO_SWITCH_EXP_FIELD
			| n_Background '.' BACKGROUND_EXP_FIELD
			| n_Box '.' BOX_EXP_FIELD
			| n_Circle '.' CIRCLE_EXP_FIELD
			| n_Color '.' COLOR_EXP_FIELD
			| n_ColorInterpolator '.' INTERPOLATOR_EXP_FIELD
			| n_Conditional '.' CONDITIONAL_EXP_FIELD
			| n_CoordinateInterpolator '.' INTERPOLATOR_EXP_FIELD
			| n_DirectionalLight '.' DIRECTIONAL_LIGHT_EXP_FIELD
			| n_DiscSensor '.' DISC_SENSOR_EXP_FIELD
			| n_Face '.' FACE_EXP_FIELD
			| n_FaceDefTables '.' FACE_DEF_TABLES_EXP_FIELD
			| n_Fog '.' FOG_EXP_FIELD
			| n_Form '.' FORM_EXP_FIELD
			| n_Group '.' GROUP_EXP_FIELD
			| n_ImageTexture '.' IMAGE_TEXTURE_EXP_FIELD
			| n_IndexedFaceSet '.' INDEXED_FACE_SET_EXP_FIELD
			| n_IndexedLineSet '.' INDEXED_LINE_SET_EXP_FIELD
			| n_Inline '.' INLINE_EXP_FIELD
			| n_LOD '.' LOD_EXP_FIELD
			| n_Material '.' MATERIAL_EXP_FIELD
			| n_MovieTexture '.' MOVIE_TEXTURE_EXP_FIELD
			| n_Normal '.' NORMAL_EXP_FIELD
			| n_OrientationInterpolator '.' ORIENTATION_INTERPOLATOR_EXP_FIELD
			| n_PlaneSensor '.' PLANE_SENSOR_EXP_FIELD
			| n_PointLight '.' POINT_LIGHT_EXP_FIELD
			| n_PointSet '.' POINT_SET_EXP_FIELD
			| n_ScalarInterpolator '.' SCALAR_INTERPOLATOR_EXP_FIELD
			| n_Shape '.' SHAPE_EXP_FIELD
			| n_Sound '.' SOUND_EXP_FIELD
			| n_SpotLight '.' SPOT_LIGHT_EXP_FIELD
			| n_Switch '.' SWITCH_EXP_FIELD
			| n_Text '.' TEXT_EXP_FIELD
			| n_TextureCoordinate '.' TEXTURE_COORDINATE_EXP_FIELD
			| n_TextureTransform '.' TEXTURE_TRANSFORM_EXP_FIELD
			| n_TouchSensor '.' TOUCH_SENSOR_EXP_FIELD
			| n_Transform '.' TRANSFORM_EXP_FIELD
			| n_Viewpoint '.' VIEWPOINT_EXP_FIELD
			;

/****************** TOP Level - Node ********************************/

GROUP_NODE:	  n_Group '{' GROUP_FIELDS '}'
		| kw_DEF kw_Identifier n_Group
 		{
		push_node_data($<STR>2, $<INT>3);
		} '{' GROUP_FIELDS '}'
		| n_Group '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_USE n_Group
		;

GROUP_FIELDS:	  GROUP_FIELD
		| GROUP_EXP_FIELD
		| GROUP_FIELDS GROUP_FIELD
		| GROUP_FIELDS GROUP_EXP_FIELD
		;

GROUP_EVENTIN:	  ei_addChildren MF_NODE
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

GROUP_EXP_FIELD:	  ef_children MF_NODE
			| ef_children error ']'
			{
			fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable node expected\n");
			}
			;

GROUP_FIELD:	  f_bboxCenter SF_VEC3F_DATA
		| f_bboxSize SF_VEC3F_DATA
		;

/*******************************************************************/

MF_NODE:	  '[' MANY_SF_NODE ']'
		;

MANY_SF_NODE:	  SF_NODE
		| MANY_SF_NODE SF_NODE
		;

SF_NODE:	  AUDIO_DELAY_NODE
		| AUDIO_FX_NODE
		| AUDIO_SOURCE_NODE
		| AUDIO_SWITCH_NODE
		| FORM_NODE	
		| INLINE_NODE
		| LAYOUT_NODE
		| LOD_NODE			
		| SWITCH_NODE
		| TRANSFORM_NODE
/*		| ANCHOR_NODE		SF_SENSOR_NODE		*/
/* end of grouping nodes					*/
		| ANCHOR_NODE
		| DISC_SENSOR_NODE
		| PLANE_SENSOR_NODE
		| TIME_SENSOR_NODE
		| TOUCH_SENSOR_NODE
/* end of Sensor nodes						*/
		| COLOR_INTERPOLATOR_NODE
		| POSITION_INTERPOLATOR_NODE
		| SCALAR_INTERPOLATOR_NODE
		| COORDINATE_INTERPOLATOR_NODE
		| NORMAL_INTERPOLATOR_NODE
		| ORIENTATION_INTERPOLATOR_NODE
/* end of Interpolator nodes					*/
		| ANIMATION_STREAM_NODE
		| CONDITIONAL_NODE
		| DIRECTIONAL_LIGHT_NODE
		| FACE_NODE
		| POINT_LIGHT_NODE
		| SHAPE_NODE
		| SOUND_NODE
		| SPOT_LIGHT_NODE
		| WORLD_INFO_NODE
/* Binable Nodes						*/
		| BACKGROUND_NODE
		| FOG_NODE
		| VIEWPOINT_NODE
		;

/********************************************************************/

SF_GEOMETRY_NODE:	  BOX_NODE
			| CIRCLE_NODE
			| CONE_NODE
			| CYLINDER_NODE
			| INDEXED_FACE_SET_NODE
			| INDEXED_LINE_SET_NODE
			| POINT_SET_NODE
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

/*******************************************************************/
                                       
ANCHOR_NODE:	  n_Anchor '{' ANCHOR_FIELDS '}'
		| n_Anchor '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier ANCHOR_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Anchor
		;

ANCHOR_FIELDS:	  ANCHOR_FIELD
		| ANCHOR_EXP_FIELD
		| ANCHOR_FIELDS ANCHOR_FIELD
		| ANCHOR_FIELDS ANCHOR_EXP_FIELD
		;

ANCHOR_EVENT:	  ef_children
		| ef_description
		| ef_parameter
		| ef_url
		;

ANCHOR_EXP_FIELD:	  ef_children MF_NODE
			| ef_children error '}'
			{
			fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable node expected\n");
			}
			| ef_description MF_STRING_DATA
			| ef_parameter MF_STRING_DATA 
			| ef_url skw_url
			{
			push_node_data( $<STR>2, $<INT>2 )
			}
			;

ANCHOR_FIELD:	  f_bboxCenter SF_VEC3F_DATA
		| f_bboxSize SF_VEC3F_DATA  
		;

/*******************************************************************/

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
			| ef_material MATERIAL_NODE
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

BACKGROUND_NODE:	  n_Background '{' BACKGROUND_FIELDS '}'
			| n_Background '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier BACKGROUND_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_Background
			;

BACKGROUND_FIELDS:	  BACKGROUND_EXP_FIELD
			| BACKGROUND_FIELDS BACKGROUND_EXP_FIELD
			;

BACKGROUND_EVENT:	  ef_groundAngle
			| ef_groundColor
			| ef_backURL
			| ef_bottomURL
			| ef_frontURL
			| ef_leftURL
			| ef_rightURL
			| ef_topURL
			| ef_skyAngle
			| ef_skyColor
			;

BACKGROUND_EVENTIN:	  ei_set_bind SF_BOOL_DATA
			;

BACKGROUND_EXP_FIELD:	  ef_groundAngle MF_NUMBER_DATA
			| ef_groundColor MF_VEC3F_DATA
			| ef_backURL skw_url
			{
			push_node_data( $<STR>2, $<INT>2 )
			}
			| ef_bottomURL skw_url
			{
			push_node_data( $<STR>2, $<INT>2 )
			}
			| ef_frontURL skw_url 
			{
			push_node_data( $<STR>2, $<INT>2 )
			}
			| ef_leftURL skw_url 
			{
			push_node_data( $<STR>2, $<INT>2 )
			}
			| ef_rightURL skw_url 
			{
			push_node_data( $<STR>2, $<INT>2 )
			}
			| ef_topURL skw_url 
			{
			push_node_data( $<STR>2, $<INT>2 )
			}
			| ef_skyAngle MF_NUMBER_DATA
			| ef_skyColor MF_VEC3F_DATA
			;

BACKGROUND_EVENTOUT:	  eo_isBound
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

BOX_EXP_FIELD:	  ef_size SF_VEC3F_DATA
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

COORDINATE_NODE:	  n_Coordinate '{' COORDINATE_EXP_FIELD '}'
			| n_Coordinate '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier COORDINATE_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_Coordinate
			;

COORDINATE_EVENT:	  ef_point
			;

COORDINATE_EXP_FIELD:	  ef_point MF_VEC3F_DATA
			;

/*******************************************************************/

COORDINATE_INTERPOLATOR_NODE:	  n_CoordinateInterpolator '{' INTERPOLATOR_FIELDS '}'
				| n_CoordinateInterpolator '{' '}'
				{
				fprintf(stderr, "line %i: warning; empty node\n",line);
				}
				| kw_DEF kw_Identifier COORDINATE_INTERPOLATOR_NODE
				{
				push_node_data($<STR>2, $<INT>3);
				}
				| kw_USE n_CoordinateInterpolator
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
		| ef_radius SF_NUMBER_DATA	/* ef_radius == f_radius */
		| f_side SF_BOOL_DATA
		| f_top SF_BOOL_DATA
		;

/*******************************************************************/

DIRECTIONAL_LIGHT_NODE:		  n_DirectionalLight '{' DIRECTIONAL_LIGHT_FIELDS '}'
				| n_DirectionalLight '{' '}'
				{
				fprintf(stderr, "line %i: warning; empty node\n",line);
				}
				| kw_DEF kw_Identifier DIRECTIONAL_LIGHT_NODE
				{
				push_node_data($<STR>2, $<INT>3);
				}
				| kw_USE n_DirectionalLight
				;

DIRECTIONAL_LIGHT_FIELDS:	  DIRECTIONAL_LIGHT_EXP_FIELD
				| DIRECTIONAL_LIGHT_FIELDS DIRECTIONAL_LIGHT_EXP_FIELD
				;

DIRECTIONAL_LIGHT_EVENT:	  ef_ambientIntensity
				| ef_color
				| ef_direction
				| ef_intensity
				| ef_on
				;

DIRECTIONAL_LIGHT_EXP_FIELD:	  ef_ambientIntensity SF_NUMBER_DATA
				| ef_color SF_VEC3F_DATA
				| ef_direction SF_VEC3F_DATA
				| ef_intensity SF_NUMBER_DATA
				| ef_on SF_BOOL_DATA
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

EXPRESSION_NODE:	  n_Expression '{' EXPRESSION_FIELDS '}'
			| n_Expression '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier EXPRESSION_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_Expression
			;

EXPRESSION_FIELDS:	  EXPRESSION_FIELD
			| EXPRESSION_FIELDS EXPRESSION_FIELD
			;

EXPRESSION_FIELD:	  f_expression_select1 	SF_NUMBER_DATA
			| f_expression_intensity1 SF_NUMBER_DATA
			| f_expression_select2 SF_NUMBER_DATA
			| f_expression_intensity2 SF_NUMBER_DATA
			| f_init_face SF_BOOL_DATA
			| f_expression_def SF_BOOL_DATA
			;

/*******************************************************************/

FACE_NODE:	  n_Face '{' FACE_FIELDS '}'
		| n_Face '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier FACE_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Face
		;


FACE_FIELDS:	  FACE_EXP_FIELD
		| FACE_FIELDS FACE_EXP_FIELD
		;

FACE_EVENT:	  ef_fit
		| ef_fdp
		| ef_fap
		| ef_ttsSource
		| ef_renderedFace
		;

FACE_EXP_FIELD:	  ef_fit FAP_NODE
		| ef_fit error '}'
		{
		fprintf(stderr, "\t -> FAP node expected\n");
		}
		| ef_fdp FDP_NODE
		| ef_fdp error '}'
		{
		fprintf(stderr, "\t -> FDP expected\n");
		}
		| ef_fap FAP_NODE
		| ef_fap error '}'
		{
		fprintf(stderr, "\t -> FAP node expected\n");
		}
		| ef_ttsSource AUDIO_SOURCE_NODE
		| ef_ttsSource error '}'
		{
		fprintf(stderr, "\t -> AudioSoure expected\n");
		}
		| ef_renderedFace GROUP_NODE
		| ef_renderedFace error '}'
		{
		fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable expected\n");
		}
		;

/*******************************************************************/

MF_FACE_DEF_MESH_NODE:	  FACE_DEF_MESH_NODE
			| MF_FACE_DEF_MESH_NODE FACE_DEF_MESH_NODE
			;

FACE_DEF_MESH_NODE:	  n_FaceDefMesh '{' FACE_DEF_MESH_FIELDS '}'
			| n_FaceDefMesh '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier FACE_DEF_MESH_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_FaceDefMesh
			;

FACE_DEF_MESH_FIELDS:	  FACE_DEF_MESH_FIELD
			| FACE_DEF_MESH_FIELDS FACE_DEF_MESH_FIELD
			;

FACE_DEF_MESH_FIELD:	  f_faceSceneGraphNode SF_NODE
			| f_faceSceneGraphNode error '}'
			{
			fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable node expected\n");
			}
			| f_intervalBorders MF_NUMBER_DATA
			| f_coordIndex MF_NUMBER_DATA
			| f_displacements MF_NUMBER_DATA
			;

/********************************************************************/

MF_FACE_DEF_TABLES_NODE:	  FACE_DEF_TABLES_NODE
				| MF_FACE_DEF_TABLES_NODE FACE_DEF_TABLES_NODE
				;

FACE_DEF_TABLES_NODE:	  n_FaceDefTables '{' FACE_DEF_TABLES_FIELDS '}'
			| n_FaceDefTables '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier FACE_DEF_TABLES_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_FaceDefTables
			;

FACE_DEF_TABLES_FIELDS:	  FACE_DEF_TABLES_FIELD
			| FACE_DEF_TABLES_EXP_FIELD
			| FACE_DEF_TABLES_FIELDS FACE_DEF_TABLES_FIELD
			| FACE_DEF_TABLES_FIELDS FACE_DEF_TABLES_EXP_FIELD
			;

FACE_DEF_TABLES_EVENT:	  ef_faceDefMesh
			| ef_faceDefTransform
			;

FACE_DEF_TABLES_EXP_FIELD:	  ef_faceDefMesh MF_FACE_DEF_MESH_NODE
				| ef_faceDefMesh error '}'
				{
				fprintf(stderr, "\t -> FaceDefMesh node expected\n");
				}
				| ef_faceDefTransform MF_FACE_DEF_TRANSFORM_NODE
				| ef_faceDefTransform error '}'
				{
				fprintf(stderr, "\t -> FaceDefTransform node expected\n");
				}
				;

FACE_DEF_TABLES_FIELD:	  f_fapID SF_NUMBER_DATA
			| f_highLevelSelect SF_NUMBER_DATA
			;

/********************************************************************/

MF_FACE_DEF_TRANSFORM_NODE:	  FACE_DEF_TRANSFORM_NODE
				| MF_FACE_DEF_TRANSFORM_NODE FACE_DEF_TRANSFORM_NODE
				;

FACE_DEF_TRANSFORM_NODE:	  n_FaceDefTransform '{' FACE_DEF_TRANSFORM_FIELDS '}'
				| n_FaceDefTransform '{' '}'
				{
				fprintf(stderr, "line %i: warning; empty node\n",line);
				}
				| kw_DEF kw_Identifier FACE_DEF_TRANSFORM_NODE						{
				push_node_data($<STR>2, $<INT>3);
				}
				| kw_USE n_FaceDefTransform
				;


FACE_DEF_TRANSFORM_FIELDS:	  FACE_DEF_TRANSFORM_FIELD
				| FACE_DEF_TRANSFORM_FIELDS FACE_DEF_TRANSFORM_FIELD
				;

FACE_DEF_TRANSFORM_FIELD:	  f_faceSceneGraphNode SF_NODE
				| f_faceSceneGraphNode error '}'
				{
				fprintf(stderr, "\t -> grouping, sensor, interpolator or bindable node expected\n");
				}
				| f_fieldId SF_NUMBER_DATA
				| f_rotationDef SF_ROTATION_DATA
				| f_scaleDef SF_VEC3F_DATA
				| f_translationDef SF_VEC3F_DATA
				;

/********************************************************************/

FAP_NODE:	  n_FAP '{' FAP_NODE_FIELDS '}'
		| n_FAP '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier FAP_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_FAP
		;

FAP_NODE_FIELDS:	  FAP_NODE_EXP_FIELD
			| FAP_NODE_FIELDS FAP_NODE_EXP_FIELD
			;

FAP_NODE_EXP_FIELD:	  ef_viseme VISEME_NODE
			| ef_viseme error '}'
			{
			fprintf(stderr, "\t -> viseme node expected\n");
			}
			| ef_expression EXPRESSION_NODE
			| ef_expression error '}'
			{
			fprintf(stderr, "\t -> expression node expected\n");
			}
			| ef_open_jaw SF_NUMBER_DATA
			| ef_lower_t_midlip SF_NUMBER_DATA
			| ef_raise_b_midlip SF_NUMBER_DATA
			| ef_stretch_l_corner SF_NUMBER_DATA
			| ef_stretch_r_corner SF_NUMBER_DATA
			| ef_lower_t_lip_lm SF_NUMBER_DATA
			| ef_lower_t_lip_rm SF_NUMBER_DATA
			| ef_lower_b_lip_lm SF_NUMBER_DATA
			| ef_lower_b_lip_rm SF_NUMBER_DATA
			| ef_raise_l_cornerlip SF_NUMBER_DATA
			| ef_raise_r_cornerlip SF_NUMBER_DATA
			| ef_thrust_jaw SF_NUMBER_DATA
			| ef_shift_jaw SF_NUMBER_DATA
			| ef_push_b_lip SF_NUMBER_DATA
			| ef_push_t_lip SF_NUMBER_DATA
			| ef_depress_chin SF_NUMBER_DATA
			| ef_close_t_l_eyelid SF_NUMBER_DATA
			| ef_close_t_r_eyelid SF_NUMBER_DATA
			| ef_close_b_l_eyelid SF_NUMBER_DATA
			| ef_close_b_r_eyelid SF_NUMBER_DATA
			| ef_yaw_l_eyeball SF_NUMBER_DATA
			| ef_yaw_r_eyeball SF_NUMBER_DATA
			| ef_pitch_l_eyeball SF_NUMBER_DATA
			| ef_pitch_r_eyeball SF_NUMBER_DATA
			| ef_thrust_l_eyeball SF_NUMBER_DATA
			| ef_thrust_r_eyeball SF_NUMBER_DATA
			| ef_dilate_l_pupil SF_NUMBER_DATA
			| ef_dilate_r_pupil SF_NUMBER_DATA
			| ef_raise_l_i_eyebrow SF_NUMBER_DATA
			| ef_raise_r_i_eyebrow SF_NUMBER_DATA
			| ef_raise_l_m_eyebrow SF_NUMBER_DATA
			| ef_raise_r_m_eyebrow SF_NUMBER_DATA
			| ef_raise_l_o_eyebrow SF_NUMBER_DATA
			| ef_raise_r_o_eyebrow SF_NUMBER_DATA
			| ef_sqeeze_l_eyebrow SF_NUMBER_DATA
			| ef_sqeeze_r_eyebrow SF_NUMBER_DATA
			| ef_puff_l_cheek SF_NUMBER_DATA
			| ef_puff_r_cheek SF_NUMBER_DATA
			| ef_lift_l_cheek SF_NUMBER_DATA
			| ef_lift_r_cheek SF_NUMBER_DATA
			| ef_shift_tongue_tip SF_NUMBER_DATA
			| ef_raise_tongue_tip SF_NUMBER_DATA
			| ef_thrust_tongue_tip SF_NUMBER_DATA
			| ef_raise_tongue SF_NUMBER_DATA
			| ef_tongue_roll SF_NUMBER_DATA
			| ef_head_pitch SF_NUMBER_DATA
			| ef_head_yaw SF_NUMBER_DATA
			| ef_head_roll SF_NUMBER_DATA
			| ef_lower_t_lip_lm_o SF_NUMBER_DATA
			| ef_lower_t_lip_rm_o SF_NUMBER_DATA
			| ef_raise_b_lip_lm_o SF_NUMBER_DATA
			| ef_raise_b_lip_rm_o SF_NUMBER_DATA
			| ef_raise_l_cornerlib_o SF_NUMBER_DATA
			| ef_stretch_l_nose SF_NUMBER_DATA
			| ef_stretch_r_nose SF_NUMBER_DATA
			| ef_raise_nose SF_NUMBER_DATA
			| ef_bend_nose SF_NUMBER_DATA
			| ef_raise_l_ear SF_NUMBER_DATA
			| ef_raise_r_ear SF_NUMBER_DATA
			| ef_pull_l_ear SF_NUMBER_DATA
			| ef_pull_r_ear SF_NUMBER_DATA
			;

/********************************************************************/

FDP_NODE:	  n_FDP '{' FDP_FIELDS '}'
		| n_FDP '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier FOG_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_FDP
		;

FDP_FIELDS:	  FDP_EXP_FIELD
		| FDP_FIELDS FDP_EXP_FIELD
		;

FDP_EVENT:	  ef_featurePointsCoord
		| ef_textureCoords
		| ef_useOrthoTexture
		| ef_faceDefTables
		| ef_faceSceneGraph
		;

FDP_EXP_FIELD:	  ef_featurePointsCoord COORDINATE_NODE
		| ef_textureCoords COORDINATE_NODE
		| ef_useOrthoTexture SF_BOOL_DATA
		| ef_faceDefTables MF_FACE_DEF_TABLES_NODE
		| ef_faceSceneGraph MF_NODE
		;

/*******************************************************************/

FOG_NODE:	  n_Fog '{' FOG_FIELDS '}'
		| n_Fog '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier FOG_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Fog
		;

FOG_FIELDS:	  FOG_EXP_FIELD
		| FOG_FIELDS FOG_EXP_FIELD
		;

FOG_EVENT:	  ef_color
		| ef_fogType
		| ef_visibilityRange
		;

FOG_EVENTIN:	  ei_set_bind
		;

FOG_EXP_FIELD:	  ef_color SF_VEC3F_DATA
		| ef_fogType d_String
		| ef_visibilityRange SF_NUMBER_DATA
		;

FOG_EVENTOUT:	  eo_isBound
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

INDEXED_FACE_SET_NODE:	  n_IndexedFaceSet '{' INDEXED_FACE_SET_FIELDS '}'
			| n_IndexedFaceSet '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier INDEXED_FACE_SET_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_IndexedFaceSet
			;

INDEXED_FACE_SET_FIELDS:	  INDEXED_FACE_SET_FIELD
				| INDEXED_FACE_SET_EXP_FIELD
				| INDEXED_FACE_SET_FIELDS INDEXED_FACE_SET_FIELD
				| INDEXED_FACE_SET_FIELDS INDEXED_FACE_SET_EXP_FIELD
				;

INDEXED_FACE_SET_EVENT:	  ef_color
			| ef_coord
			| ef_normal
			| ef_texCoord
			;

INDEXED_FACE_SET_EVENTIN:	  ei_set_colorIndex
				| ei_set_coordIndex
				| ei_set_normalIndex
				| ei_set_texCoordIndex
				;


INDEXED_FACE_SET_EXP_FIELD:	  ef_color COLOR_NODE
				| ef_color error '}'
				{
				fprintf(stderr, "\t -> Color node expected\n");
				}
				| ef_coord COORDINATE_NODE
				| ef_coord error '}'
				{
				fprintf(stderr, "\t -> Coordinate node expected\n");
				}
				| ef_normal NORMAL_NODE
				| ef_normal error '}'
				{
				fprintf(stderr, "\t -> Normal node expected\n");
				}
				| ef_texCoord TEXTURE_COORDINATE_NODE
				| ef_texCoord error '}'
				{
				fprintf(stderr, "\t -> TextureCoordinate node expected\n");
				}
				;

INDEXED_FACE_SET_FIELD:	  f_ccw SF_BOOL_DATA
			| f_colorIndex MF_NUMBER_DATA
			| f_colorPerVertex SF_BOOL_DATA
			| f_convex SF_BOOL_DATA
			| f_coordIndex MF_NUMBER_DATA
			| f_creaseAngle SF_NUMBER_DATA
			| f_normalIndex MF_NUMBER_DATA
			| f_normalPerVertex SF_BOOL_DATA
			| f_solid SF_BOOL_DATA
			| f_texCoordIndex MF_NUMBER_DATA
			;

/*******************************************************************/

INDEXED_LINE_SET_NODE:	  n_IndexedLineSet '{' INDEXED_LINE_SET_FIELDS '}'
			| n_IndexedLineSet '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier INDEXED_LINE_SET_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_IndexedLineSet
			;

INDEXED_LINE_SET_FIELDS:	  INDEXED_LINE_SET_FIELD
				| INDEXED_LINE_SET_EXP_FIELD
				| INDEXED_LINE_SET_FIELDS INDEXED_LINE_SET_FIELD
				| INDEXED_LINE_SET_FIELDS INDEXED_LINE_SET_EXP_FIELD
				;

INDEXED_LINE_SET_EVENT:	  ef_color
			| ef_coord
			;

INDEXED_LINE_SET_EVENTIN:	  ei_set_colorIndex
				| ei_set_coordIndex
				;

INDEXED_LINE_SET_EXP_FIELD:	  ef_color COLOR_NODE
				| ef_color error '}'
				{
				fprintf(stderr, "\t -> Color node expected\n");
				}
				| ef_coord COORDINATE_NODE
				| ef_coord error '}'
				{
				fprintf(stderr, "\t -> Coordinate node expected\n");
				}
				;

INDEXED_LINE_SET_FIELD:	  f_colorIndex MF_NUMBER_DATA
			| f_colorPerVertex SF_BOOL_DATA
			| f_coordIndex MF_NUMBER_DATA
			;

/*******************************************************************/

INLINE_NODE:	  n_Inline '{' INLINE_FIELDS '}'
		| n_Inline '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier INLINE_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Inline
		;

INLINE_FIELDS:	  INLINE_FIELD
		| INLINE_EXP_FIELD
		| INLINE_FIELDS INLINE_FIELD
		| INLINE_FIELDS INLINE_EXP_FIELD
		;

INLINE_EVENT:	  ef_url
		;

INLINE_EXP_FIELD:	  ef_url skw_url 
			{
			push_node_data( $<STR>2, $<INT>2 )
			}
			;

INLINE_FIELD:	  f_bboxCenter SF_VEC3F_DATA
		| f_bboxSize SF_VEC3F_DATA
		;

/*******************************************************************/

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

LOD_NODE:	  n_LOD '{' LOD_FIELDS '}'
		| n_LOD '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier LOD_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_LOD
		;

LOD_FIELDS:	  LOD_FIELDS
		| LOD_EXP_FIELD
		| LOD_FIELDS LOD_FIELD
		| LOD_FIELDS LOD_EXP_FIELD
		;

LOD_EVENT:	  ef_level
		;

LOD_EXP_FIELD:	  ef_level MF_NODE
		;

LOD_FIELD:	  ef_center SF_VEC3F_DATA
		| f_range MF_NUMBER_DATA
		;

/*******************************************************************/

MATERIAL_NODE:	  n_Material '{' MATERIAL_FIELDS '}'
		| n_Material '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier MATERIAL_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Material
		;

MATERIAL_FIELDS:	  MATERIAL_EXP_FIELD
			| MATERIAL_FIELDS MATERIAL_EXP_FIELD
			;

MATERIAL_EVENT:	  ef_ambientIntensity
		| ef_diffuseColor
		| ef_emissiveColor
		| ef_shininess
		| ef_specularColor
		| ef_transparency
		;

MATERIAL_EXP_FIELD:	  ef_ambientIntensity SF_NUMBER_DATA
			| ef_diffuseColor SF_VEC3F_DATA
			| ef_emissiveColor SF_VEC3F_DATA
			| ef_shininess SF_NUMBER_DATA
			| ef_specularColor SF_VEC3F_DATA
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

NORMAL_NODE:	  n_Normal '{' NORMAL_EXP_FIELD '}'
		| n_Normal '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier NORMAL_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Normal
		;

NORMAL_EVENT:	  ef_vector
		;

NORMAL_EXP_FIELD:	  ef_vector MF_VEC3F_DATA
			;

/*******************************************************************/

NORMAL_INTERPOLATOR_NODE:	  n_NormalInterpolator '{' INTERPOLATOR_FIELDS '}'
				| n_NormalInterpolator '{' '}'
				{
				fprintf(stderr, "line %i: warning; empty node\n",line);
				}
				| kw_DEF kw_Identifier NORMAL_INTERPOLATOR_NODE
				{
				push_node_data($<STR>2, $<INT>3);
				}
				| kw_USE n_NormalInterpolator
				;

/*******************************************************************/

ORIENTATION_INTERPOLATOR_NODE:	  n_OrientationInterpolator '{' ORIENTATION_INTERPOLATOR_FIELDS '}'
				| n_OrientationInterpolator '{' '}'
				{
				fprintf(stderr, "line %i: warning; empty node\n",line);
				}
				| kw_DEF kw_Identifier ORIENTATION_INTERPOLATOR_NODE
				{
				push_node_data($<STR>2, $<INT>3);
				}
				| kw_USE n_OrientationInterpolator
				;

ORIENTATION_INTERPOLATOR_FIELDS:	  ORIENTATION_INTERPOLATOR_EXP_FIELD
					| ORIENTATION_INTERPOLATOR_FIELDS ORIENTATION_INTERPOLATOR_EXP_FIELD
					;

ORIENTATION_INTERPOLATOR_EVENT:	  ef_key
				| ef_keyValue
				;

ORIENTATION_INTERPOLATOR_EVENTIN:	  ei_set_fraction
					;

ORIENTATION_INTERPOLATOR_EXP_FIELD:	  ef_key MF_NUMBER_DATA
					| ef_keyValue MF_ROTATION_DATA
					;

ORIENTATION_INTERPOLATOR_EVENTOUT:	  eo_value_changed
					;

/********************************************************************/

PLANE_SENSOR_NODE:	  n_PlaneSensor '{' PLANE_SENSOR_FIELDS '}'
			| n_PlaneSensor '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier PLANE_SENSOR_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_PlaneSensor
			;

PLANE_SENSOR_FIELDS:	  PLANE_SENSOR_EXP_FIELD
			| PLANE_SENSOR_FIELDS PLANE_SENSOR_EXP_FIELD
			;

PLANE_SENSOR_EVENT:	  ef_autoOffset
			| ef_enabled
			| ef_maxPosition
			| ef_minPosition
			| ef_offset
			;

PLANE_SENSOR_EXP_FIELD:	  ef_autoOffset SF_BOOL_DATA
			| ef_enabled SF_BOOL_DATA
			| ef_maxPosition SF_VEC2F_DATA
			| ef_minPosition SF_VEC2F_DATA
			| ef_offset SF_VEC3F_DATA
			;

PLANE_SENSOR_EVENTOUT:	  eo_isActive
			| eo_trackPoint_changed
			| eo_translation_changed
			;

/*******************************************************************/

POINT_LIGHT_NODE:	  n_PointLight '{' POINT_LIGHT_FIELDS '}'
			| n_PointLight '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier POINT_LIGHT_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_PointLight
			;

POINT_LIGHT_FIELDS:	  POINT_LIGHT_FIELDS
			| POINT_LIGHT_FIELDS POINT_LIGHT_EXP_FIELD
			;

POINT_LIGHT_EVENT:	  ef_ambientIntensity
			| ef_attenuation
			| ef_color
			| ef_intensity
			| ef_location
			| ef_on
			| ef_radius
			;

POINT_LIGHT_EXP_FIELD:	  ef_ambientIntensity SF_NUMBER_DATA
			| ef_attenuation SF_VEC3F_DATA
			| ef_color SF_NUMBER_DATA
			| ef_intensity SF_NUMBER_DATA
			| ef_location SF_VEC3F_DATA
			| ef_on SF_BOOL_DATA
			| ef_radius SF_NUMBER_DATA
			;

/*******************************************************************/

POINT_SET_NODE:		  n_PointSet '{' POINT_SET_FIELDS '}'
			| n_PointSet '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier POINT_SET_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_PointSet
			;

POINT_SET_FIELDS:	  POINT_SET_EXP_FIELD
			| POINT_SET_FIELDS POINT_SET_EXP_FIELD
			;

POINT_SET_EVENT:	  ef_color
			| ef_coord
			;

POINT_SET_EXP_FIELD:	  ef_color COLOR_NODE
			| ef_color error '}'
			{
			fprintf(stderr, "\t -> Color node expected\n");
			}
			| ef_coord COORDINATE_NODE
			| ef_coord error '}'
			{
			fprintf(stderr, "\t -> Coordinate node expected\n");
			}
			;

/*******************************************************************/

POSITION_INTERPOLATOR_NODE:	  n_PositionInterpolator '{' INTERPOLATOR_FIELDS '}'
				| n_PositionInterpolator '{' '}'
				{
				fprintf(stderr, "line %i: warning; empty node\n",line);
				}
				| kw_DEF kw_Identifier POSITION_INTERPOLATOR_NODE
				{
				push_node_data($<STR>2, $<INT>3);
				}
				| kw_USE n_PositionInterpolator
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

SOUND_NODE:	  n_Sound '{' SOUND_FIELDS '}'
		| n_Sound '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier SOUND_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Sound
		;

SOUND_FIELDS:	  SOUND_FIELD
		| SOUND_EXP_FIELD
		| SOUND_FIELDS SOUND_FIELD
		| SOUND_FIELDS SOUND_EXP_FIELD
		;

SOUND_EVENT:	   ef_direction
		 | ef_intensity
		 | ef_location
		 | ef_maxBack
		 | ef_maxFront
		 | ef_minBack
		 | ef_minFront
		 | ef_priority
		 | ef_source
		 ;

SOUND_EXP_FIELD:	  ef_direction SF_VEC3F_DATA
			| ef_intensity SF_NUMBER_DATA
			| ef_location SF_VEC3F_DATA
			| ef_maxBack SF_NUMBER_DATA
			| ef_maxFront SF_NUMBER_DATA
			| ef_minBack SF_NUMBER_DATA
			| ef_minFront SF_NUMBER_DATA
			| ef_priority SF_NUMBER_DATA
			| ef_source AUDIO_SOURCE_NODE
			;

SOUND_FIELD:	  f_spatialize SF_BOOL_DATA
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

/*******************************************************************/

SPOT_LIGHT_NODE:	  n_SpotLight '{' SPOT_LIGHT_FIELDS '}'
			| n_SpotLight '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier SPOT_LIGHT_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_SpotLight
			;

SPOT_LIGHT_FIELDS:	  SPOT_LIGHT_EXP_FIELD
			| SPOT_LIGHT_FIELDS SPOT_LIGHT_EXP_FIELD
			;

SPOT_LIGHT_EVENT:	  ef_ambientIntensity
			| ef_attenuation
			| ef_beamWidth
			| ef_color
			| ef_cutOffAngle
			| ef_direction
			| ef_intensity
			| ef_location
			| ef_on
			| ef_radius
			;

SPOT_LIGHT_EXP_FIELD:	  ef_ambientIntensity SF_NUMBER_DATA
			| ef_attenuation SF_VEC3F_DATA
			| ef_beamWidth SF_NUMBER_DATA
			| ef_color SF_VEC3F_DATA
			| ef_cutOffAngle SF_NUMBER_DATA
			| ef_direction SF_NUMBER_DATA
			| ef_intensity SF_NUMBER_DATA
			| ef_location SF_VEC3F_DATA
			| ef_on SF_BOOL_DATA
			| ef_radius SF_NUMBER_DATA
			;

/*******************************************************************/

SWITCH_NODE:	  n_Switch '{' SWITCH_FIELDS '}'
		| n_Switch '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier SWITCH_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Switch
		;

SWITCH_FIELDS:	  SWITCH_EXP_FIELD
		| SWITCH_FIELDS SWITCH_EXP_FIELD
		;

SWITCH_EVENT:	  ef_choice
		| ef_wichChoice
		;

SWITCH_EXP_FIELD:	  ef_choice MF_NODE
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

TRANSFORM_NODE:		  n_Transform '{' TRANSFORM_FIELDS '}'
			| n_Transform '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier TRANSFORM_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_Transform
			;

TRANSFORM_FIELDS:	  TRANSFORM_FIELD
			| TRANSFORM_EXP_FIELD
			| TRANSFORM_FIELDS TRANSFORM_FIELD
			| TRANSFORM_FIELDS TRANSFORM_EXP_FIELD
			;

TRANSFORM_EVENT:	  ef_center
			| ef_children
			| ef_rotation
			| ef_scale
			| ef_scaleOrientation
			| ef_translation
			;

TRANSFORM_EVENTIN:	  ei_addChildren MF_NODE
			| ei_addChildren error ']'
			| ei_removeChildren MF_NODE
			| ei_removeChildren error ']'
			;


TRANSFORM_EXP_FIELD:	  ef_center SF_VEC3F_DATA
			| ef_children MF_NODE
			| ef_rotation  SF_ROTATION_DATA
			| ef_scale SF_VEC3F_DATA
			| ef_scaleOrientation SF_ROTATION_DATA
			| ef_translation SF_VEC3F_DATA
			;

TRANSFORM_FIELD:	  f_bboxCenter
			| f_bboxSize
			;

/*******************************************************************/

VIEWPOINT_NODE:		  n_Viewpoint '{' VIEWPOINT_FIELDS '}'
			| n_Viewpoint '{' '}'
			{
			fprintf(stderr, "line %i: warning; empty node\n",line);
			}
			| kw_DEF kw_Identifier VIEWPOINT_NODE
			{
			push_node_data($<STR>2, $<INT>3);
			}
			| kw_USE n_Viewpoint
			;

VIEWPOINT_FIELDS:	  VIEWPOINT_FIELD
			| VIEWPOINT_EXP_FIELD
			| VIEWPOINT_FIELDS VIEWPOINT_FIELD
			| VIEWPOINT_FIELDS VIEWPOINT_EXP_FIELD
			;

VIEWPOINT_EVENT:	  ef_fieldOfView
			| ef_jump
			| ef_orientation
			| ef_position
			;

VIEWPOINT_EVENTIN:	  ei_set_bind
			;

VIEWPOINT_EXP_FIELD:	  ef_fieldOfView SF_NUMBER_DATA
			| ef_jump SF_BOOL_DATA
			| ef_orientation SF_ROTATION_DATA
			| ef_position SF_VEC3F_DATA
			;

VIEWPOINT_FIELD:	  ef_description d_String
			;

VIEWPOINT_EVENTOUT:	  eo_bindTime
			| eo_isBound
			;

/*******************************************************************/

VISEME_NODE:	  n_Viseme '{' VISEME_FIELDS '}'
		| n_Viseme '{' '}'
		{
		fprintf(stderr, "line %i: warning; empty node\n",line);
		}
		| kw_DEF kw_Identifier VISEME_NODE
		{
		push_node_data($<STR>2, $<INT>3);
		}
		| kw_USE n_Viseme
		;

VISEME_FIELDS:	  VISEME_FIELD
		| VISEME_FIELDS VISEME_FIELD
		;

VISEME_FIELD:	  f_viseme_select1 SF_NUMBER_DATA
		| f_viseme_select2 SF_NUMBER_DATA
		| f_viseme_blend SF_NUMBER_DATA
		| f_viseme_def SF_BOOL_DATA
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


/******************* Object descriptor ******************************/

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
/* not scecified in documentation of BifsEnc 	*/
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

int yyerror ()
{
fprintf (stderr, "line %i: syntax error; \"%s\" unexpected in this context\n" , line, yytext);
return 0;
}
