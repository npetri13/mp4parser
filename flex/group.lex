/* Copyright © 2022 Nico Petri, 03172 Guben, Germany
*
*  Permission is hereby granted, free of charge, to any person obtaining a
*  copy of this software and associated documentation files
*  (the “Software”), to deal in the Software without restriction, including
*  without limitation the rights to use, copy, modify, merge, publish,
*  distribute, sublicense, and/or sell copies of the Software, and to permit
*  persons to whom the Software is furnished to do so, subject to the following
*  conditions:
*
*  The above copyright notice and this permission notice shall be included in
*  all copies or substantial portions of the Software.
*
*  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
*  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
*  IN THE SOFTWARE.
*
*  group.lex
*  Created by Nico Petri on 10.06.2000.
*/

%{
#include "../clang/header/group.h"
#include "../clang/header/shared_dec.h"
#include "../clang/header/node_table.h"
%}

%option noyywrap

%x FILE_NAME RESTORE_ID ROUTE_NAME ROUTE_DEF STORE_ID STRING URL


FILE_NAME			[\-\_A-Za-z0-9]+[\.]{1,}[A-Za-z0-9]+
DIGIT				[0-9]+
XDIGIT				[\+\-]?0[xX]{1}[A-Fa-f0-9]{1,8}
EXP				[\+\-]{1}[0-9]+

%%
[\n]				++line;
[[:blank:]]+

\".*\"				|
\[\".*\"\]			{ return d_String; }

\#.*				

(\{)				|
(\})				|
(\[)				|
(\])				|
(,)				|
(\.)				{
/* accepting all braces 						*/
return *yytext;
}

[\+\-]?{DIGIT}			|
[\+\-]?{DIGIT}\.{DIGIT}		|
[\+\-]?{DIGIT}\.{DIGIT}e{EXP}	|	
{XDIGIT}			{return d_Number;}

"TRUE"				return d_TRUE;
"FALSE"				return d_FALSE;

"Group"				{yylval.INT = n_Group; return n_Group;}
"WorldInfo"			{yylval.INT = n_WorldInfo; return n_WorldInfo;}

"Anchor"			{yylval.INT = n_Anchor; return n_Anchor;}
"AnimationStream"		{yylval.INT = n_AnimationStream; return n_AnimationStream;}
"Appearance"			{yylval.INT = n_Appearance; return n_Appearance;}
"AudioDelay"			{yylval.INT = n_AudioDelay; return n_AudioDelay;}
"AudioFX"			{yylval.INT = n_AudioFX; return n_AudioFX;}
"AudioMix"			{yylval.INT = n_AudioMix; return n_AudioMix;}
"AudioSource"			{yylval.INT = n_AudioSource; return n_AudioSource;}
"AudioSwitch"			{yylval.INT = n_AudioSwitch; return n_AudioSwitch;}
"Background"			{yylval.INT = n_Background; return n_Background;}
"Box"				{yylval.INT = n_Box; return n_Box;}
"Circle"			{yylval.INT = n_Circle; return n_Circle;}
"Color"				{yylval.INT = n_Color; return n_Color;}
"ColorInterpolator"		{yylval.INT = n_ColorInterpolator; return n_ColorInterpolator;}
"Conditional"			{yylval.INT = n_Conditional; return n_Conditional;}
"Cone"				{yylval.INT = n_Cone; return n_Cone;}
"Coordinate"			{yylval.INT = n_Coordinate; return n_Coordinate;}
"CoordinateInterpolator"	{yylval.INT = n_CoordinateInterpolator; return n_CoordinateInterpolator;}
"Cylinder"			{yylval.INT = n_Cylinder; return n_Cylinder;}
"DirectionalLight"		{yylval.INT = n_DirectionalLight; return n_DirectionalLight;}
"DiscSensor"			{yylval.INT = n_DiscSensor; return n_DiscSensor;}
"Expression"			{yylval.INT = n_Expression; return n_Expression;}
"Face"				{yylval.INT = n_Face; return n_Face;}
"FaceDefMesh"			{yylval.INT = n_FaceDefMesh; return n_FaceDefMesh;}
"FaceDefTables"			{yylval.INT = n_FaceDefTables; return n_FaceDefTables;}
"FaceDefTransform"		{yylval.INT = n_FaceDefTransform; return n_FaceDefTransform;}
"FAP"				{yylval.INT = n_FAP; return n_FAP;}
"FDP"				{yylval.INT = n_FDP; return n_FDP;}
"Fog"				{yylval.INT = n_Fog; return n_Fog;}
"FontStyle"			{yylval.INT = n_FontStyle; return n_FontStyle;}
"Form"				{yylval.INT = n_Form; return n_Form;}
"ImageTexture"			{yylval.INT = n_ImageTexture; return n_ImageTexture;}
"IndexedFaceSet"		{yylval.INT = n_IndexedFaceSet; return n_IndexedFaceSet;}
"IndexedLineSet"		{yylval.INT = n_IndexedLineSet; return n_IndexedLineSet;}
"Inline"			{yylval.INT = n_Inline; return n_Inline;}
"Layout"			{yylval.INT = n_Layout; return n_Layout;}
"LOD"				{yylval.INT = n_LOD; return n_LOD;}
"Material"			{yylval.INT = n_Material; return n_Material;}
"MovieTexture"			{yylval.INT = n_MovieTexture; return n_MovieTexture;}
"Normal"			{yylval.INT = n_Normal; return n_Normal;}
"NormalInterpolator"		{yylval.INT = n_NormalInterpolator; return n_NormalInterpolator;}
"OrientationInterpolator"	{yylval.INT = n_OrientationInterpolator; return n_OrientationInterpolator;}
"PlaneSensor"			{yylval.INT = n_PlaneSensor; return n_PlaneSensor;}
"PointLight"			{yylval.INT = n_PointLight; return n_PointLight;}
"PointSet"			{yylval.INT = n_PointSet; return n_PointSet;}
"PositionInterpolator"		{yylval.INT = n_PositionInterpolator; return n_PositionInterpolator;}
"Rectangle"			{yylval.INT = n_Rectangle; return n_Rectangle;}
"ScalarInterpolator"		{yylval.INT = n_ScalarInterpolator; return n_ScalarInterpolator;}
"Shape"				{yylval.INT = n_Shape; return n_Shape;}
"Sound"				{yylval.INT = n_Sound; return n_Sound;}
"Sphere"			{yylval.INT = n_Sphere; return n_Sphere;}
"SpotLight"			{yylval.INT = n_SpotLight; return n_SpotLight;}
"Switch"			{yylval.INT = n_Switch; return n_Switch;}
"Text"				{yylval.INT = n_Text; return n_Text;}
"TextureCoordinate"		{yylval.INT = n_TextureCoordinate; return n_TextureCoordinate;}
"TextureTransform"		{yylval.INT = n_TextureTransform; return n_TextureTransform;}
"TimeSensor"			{yylval.INT = n_TimeSensor; return n_TimeSensor;}
"TouchSensor"			{yylval.INT = n_TouchSensor; return n_TouchSensor;}
"Transform"			{yylval.INT = n_Transform; return n_Transform;}
"Viewpoint"			{yylval.INT = n_Viewpoint; return n_Viewpoint;}
"Viseme"			{yylval.INT = n_Viseme; return n_Viseme;}


"ambientIntensity"		return ef_ambientIntensity;
"appearance"			return ef_appearance;
"attenuation"			return ef_attenuation;
"autoOffset"			return ef_autoOffset;
"backURL"			{
				BEGIN(URL);
				return ef_backURL;
				}
"beamWidth"			return ef_beamWidth;
"bottomURL"			{
				BEGIN(URL);
				return ef_bottomURL;
				}
"buffer"			return ef_buffer;
"center"			return ef_center;
"children"			return ef_children;
"choice"			return ef_choice;
"color"				return ef_color;
"constraint"			return ef_constraint;
"coord"				return ef_coord;
"cutOffAngle"			return ef_cutOffAngle;
"cycleInterval"			return ef_cycleInterval;
"delay"				return ef_delay;
"description"			return ef_description;
"diffuseColor"			return ef_diffuseColor;
"direction"			return ef_direction;
"emissiveColor"			return ef_emissiveColor;
"enabled"			return ef_enabled;
"fieldOfView"			return ef_fieldOfView;
"fogType"			return ef_fogType;
"fontStyle"			return ef_fontStyle; 
"frontURL"			{
				BEGIN(URL);
				return ef_frontURL;
				}
"geometry"			return ef_geometry;
"groundAngle"			return ef_groundAngle;
"groundColor"			return ef_groundColor;
"groups"			return ef_groups;
"groupsIndex"			return ef_groupsIndex;
"horizontal"			return ef_horizontal;
"intensity"			return ef_intensity;
"jump"				return ef_jump;
"justify"			return ef_justify;
"key"				return ef_key;
"keyValue"			return ef_keyValue;
"leftToRight"			return ef_leftToRight;
"leftURL"			{
				BEGIN(URL);
				return ef_leftURL;
				}
"length"			return ef_length;
"level"				return ef_level;
"location"			return ef_location;
"loop"				return ef_loop;
"material"			return ef_material;
"matrix"			return ef_matrix;
"maxAngle"			return ef_maxAngle;
"maxBack"			return ef_maxBack;
"maxFront"			return ef_maxFront;
"maxExtent"			return ef_maxExtent;
"maxPosition"			return ef_maxPosition;
"minAngle"			return ef_minAngle;
"minBack"			return ef_minBack;
"minFront"			return ef_minFront;
"minPosition"			return ef_minPosition;
"normal"			return ef_normal;
"numInputs"			return ef_numInputs;
"on"				return ef_on;
"orch"				return ef_orch;
"orientation"			return ef_orientation;
"parameter"			return ef_parameter;
"params"			return ef_params;
"pitch"				return ef_pitch;
"point"				return ef_point;
"position"			return ef_position;
"priority"			return ef_priority;
"radius"			return ef_radius;
"rightURL"			{
				BEGIN(URL);
				return ef_rightURL;
				}
"rotation"			return ef_rotation;
"scale"				return ef_scale;
"scaleOrientation"		return ef_scaleOrientation;
"score"				return ef_score;
"scrollRate"			return ef_scrollRate;
"scrollVertical"		return ef_scrollVertical;
"size"				return ef_size;
"skyAngle"			return ef_skyAngle;
"skyColor"			return ef_skyColor;
"shininess"			return ef_shininess;
"smothScroll"			return ef_smothScroll;
"source"			return ef_source;
"spacing"			return ef_spacing;
"specularColor"			return ef_specularColor;
"speed"				return ef_speed;
"startTime"			return ef_startTime;
"stopTime"			return ef_stopTime;
"string"			return ef_string;
"texCoord"			return ef_texCoord;
"texture"			return ef_texture;
"textureTransform"		return ef_textureTransform;
"topToBottom"			return ef_topToBottom;
"topURL"			{
				BEGIN(URL);
				return ef_topURL;
				}
"translation"			return ef_translation;
"transparency"			return ef_transparency;
"vector"			return ef_vector;
"visibilityRange"		return ef_visibilityRange;
"url"				{
				BEGIN(URL);
				return ef_url;
				}
"wichChoice"			return ef_wichChoice;
"wrap"				return ef_wrap;

"activate"			return ei_activate;
"addChildren"			return ei_addChildren;
"removeChildren"		return ei_removeChildren;
"reverseActivate"		return ei_reverseActivate;
"set_bind"			return ei_set_bind;
"set_colorIndex"		return ei_set_colorIndex;
"set_coordIndex"		return ei_set_coordIndex;
"set_fraction"			return ei_set_fraction;
"set_normalIndex"		return ei_set_normalIndex;
"set_texCoordIndex"		return ei_set_texCoordIndex;



"bboxCenter"			return f_bboxCenter;
"bboxSize"			return f_bboxSize;
"botoom"			return f_bottom;
"bottomRadius"			return f_bottomRadius;
"ccw"				return f_ccw;
"colorIndex"			return f_colorIndex;
"colorPerVertex"		return f_colorPerVertex;
"convex"			return f_convex;
"coordIndex"			return f_coordIndex;
"creaseAngle"			return f_creaseAngle;
"expression_def"		return f_expression_def;
"expression_intensity1"		return f_expression_intensity1;
"expression_intensity2"		return f_expression_intensity2;
"expression_select1"		return f_expression_select1;
"expression_select2"		return f_expression_select2;
"family"			return f_family;
"height"			return f_height;
"info"				return f_info;
"init_face"			return f_init_face;
"language"			return f_language;
"normalIndex"			return f_normalIndex;
"normalPerVertex"		return f_normalPerVertex;
"numChan"			return f_numChan;
"phaseGroup"			return f_phaseGroup;
"range"				return f_range;
"repeatS"			return f_repeatS;
"repeatT"			return f_repeatT;
"side"				return f_side;
"solid"				return f_solid;
"spatialize"			return f_spatialize;
"style"				return f_style;
"texCoordIndex"			return f_texCoordIndex;
"title"				{
				BEGIN(STRING);
				return f_title;
				}
"top"				return f_top;
"viseme_select1"		return f_viseme_select1;
"viseme_select2"		return f_viseme_select2;
"viseme_blend"			return f_viseme_blend;
"viseme_def"			return f_viseme_def;



"bindTime"			return eo_bindTime;
"cycleTime"			return eo_cycleTime;
"duration_changed"		return eo_duration_changed;
"fraction_changed"		return eo_fraction_changed;
"hitNormal_changed"		return eo_hitNormal_changed;
"hitPoint_changed"		return eo_hitPoint_changed;
"hitTexCoord_changed"		return eo_hitTexCoord_changed;
"isActive"			return eo_isActive;
"isBound"			return eo_isBound;
"isOver"			return eo_isOver;
"rotation_changed"		return eo_rotation_changed;
"time "				return eo_time;
"touchTime"			return eo_touchTime;
"trackPoint_changed"		return eo_trackPoint_changed;
"translation_changed"		return eo_translation_changed;
"value_changed"			return eo_value_changed;



"APPEND"[ ]+"TO"		{
				BEGIN(RESTORE_ID);
				return kw_APPEND_TO;
				}
"AT"				return kw_AT;
"BY"				return kw_BY;
"DEF"				{
				BEGIN(STORE_ID);
				return kw_DEF;
				}
"DELETE"			{
				BEGIN(RESTORE_ID);
				return kw_DELETE;
				}
"INSERT"			return kw_INSERT;
"LAST"				return kw_LAST;
"OD"				return kw_OD;
"REPLACE"			{
				BEGIN(RESTORE_ID);
				return kw_REPLACE;
				}
"ROUTE"				{
				BEGIN(RESTORE_ID);
				return kw_ROUTE;
				}
"ROUTE DEF"			{
				BEGIN(ROUTE_DEF);
				return skw_ROUTE_DEF;
				}
"TO"				{
				BEGIN(RESTORE_ID);
				return kw_TO;
				}
"UPDATE"			return kw_UPDATE;
"USE"				{
				BEGIN(RESTORE_ID);
				return kw_USE;
				}

<FILE_NAME>[\n]{1,}		++line;
<FILE_NAME>[[:blank:]]+
<FILE_NAME>{FILE_NAME}		{
				BEGIN(0);
				return d_String;
				}
<STRING>[\n]{1,}		++line;
<STRING>[[:blank:]]+
<STRING>\"[A-Za-z0-9]+\"	{
				BEGIN(0);
				return d_String;
				}
<STRING>[A-Za-z0-9]+		{
				BEGIN(0);				
				return d_String;
				}
<STORE_ID>[\n]{1,}		++line;
<STORE_ID>[[:blank:]]+
<STORE_ID>[A-Za-z0-9]+		{
				yylval.STR = (char *) strdup(yytext);
				BEGIN(0);
				return kw_Identifier;
				}
<RESTORE_ID>[\n]{1,}		++line;
<RESTORE_ID>[[:blank:]]+
<RESTORE_ID>[A-Za-z0-9]+	{
				poped_number = pop_node_data( (char *) strdup(yytext) );
				if( poped_number == 0) 
				fprintf (stderr, "line %i: syntax error; using unknown identifier \"%s\" \n" , line, yytext);
				BEGIN(0);
				return poped_number; 
				}
<ROUTE_DEF>[\n]{1,}		++line;
<ROUTE_DEF>[[:blank:]]+		
<ROUTE_DEF>[A-Za-z0-9]+		{
				yylval.STR = (char *) strdup(yytext);
				BEGIN(RESTORE_ID);
				return kw_Identifier;
				}
<URL>[\n]{1,}			++line;
<URL>[[:blank:]]+		
<URL>\"				
<URL>{FILE_NAME}		|
<URL>[A-Za-z]+			|		
<URL>[0-9]+			{
				yylval.STR = (char *) strdup(yytext);
				BEGIN(0);
				return skw_url;
				}

"AU_Length"			return od_AU_Length;
"accessUnitUnitRate"		return od_accessUnitRate;
"alConfigDescr"			return od_alConfigDescr;
"avgBitrate"			return od_avgBitrate;
"bufferSizeDB"			return od_bufferSizeDB;
"compatibility"			return od_compatibility;
"compositionUnitRate"		return od_compositionUnitRate;
"content_identifier"		{
				BEGIN(STRING);
				return od_content_identifier; 
				}
"decConfigDescr"		return od_decConfigDescr;
"degradationPriorityLength"	return od_degradationPriorityLength;
"dependsOn_ES_number"		return od_dependsOn_ES_number;
"descriptorData"		{
				BEGIN(STRING);
				return od_descriptorData;
				}
"descriptorTag"			return od_descriptorTag;
"es_descriptor"			return od_es_descriptor;
"es_Number"			return od_es_Number;
"extensionDescriptor"		return od_extensionDescriptor;
"fileName"			{
				BEGIN(FILE_NAME);
				return od_fileName;
				}
"ipiDescr"			return od_ipiDescr;
"IP_IDSs"			return od_IP_IDSs;
"IPI_ES_Id"			return od_IPI_ES_Id;
"instantBitrateLength"		return od_instantBitrateLength;
"language_code"			return od_language_code;
"maxBitrate"			return od_maxBitrate;
"OCR_ES_Id"			return od_OCR_ES_Id;
"OCRLength"			return od_OCRLength;
"OCRResolution"			return od_OCRResolution;
"objectDescriptorID"		return od_objectDescriptorID;
"predefined"			return od_predefined;
"profileAndLevelIndication"	return od_profileAndLevelIndication;
"QoS_Qualifier"			return od_QoS_Qualifier;
"qosDescr"			return od_qosDescr;
"remoteODflag"			return od_remoteODflag;
"seqNumLength"			return od_seqNumLength;
"specificInfo"			{
				BEGIN(STRING);
				return od_specificInfo;
				}
"startCompositionTimeStamp"	return od_startCompositionTimeStamp;
"startDecodingTimeStamp"	return od_startDecodingTimeStamp;
"streamData"			return od_streamData;
"streamPriority"		return od_streamPriority;
"streamType"			return od_streamType;
"supplemetaryContentIdentifier"	return od_supplementaryContentIdentifier;
"timeStampLength"		return od_timeStampLength;
"timeStampResolution"		return od_timeStampResolution;
"type_of_content"		return od_type_of_content;
"type_of_content_identifier"	return od_type_of_content_identifier;
"upStream"			return od_upStream;
"useAccessUnitEndFlag"		return od_useAccessUnitEndFlag;
"useAccessUnitStartFlag"	return od_useAccessUnitStartFlag;
"usePaddingFlag"		return od_usePaddingFlag;
"useRandomAccessPointFlag"	return od_useRandomAccessPointFlag;
"useTimeStampsFlag"		return od_useTimeStampsFlag;
"useWallClockTimeStampFlag"	return od_useWallClockTimeStampFlag;
"value"				{
				BEGIN(STRING);
				return od_value;
				}
"wallClockTimeStamp"		return od_wallClockTimeStamp;



"fit"				return ef_fit;
"fdp"				return ef_fdp;
"fap"				return ef_fap;
"ttsSource"			return ef_ttsSource;
"renderedFace"			return ef_renderedFace;

"faceSceneGraphNode"		return f_faceSceneGraphNode;
"intervalBorders"		return f_intervalBorders;
"displacements"			return f_displacements;

"fapID"				return f_fapID;
"highLevelSelect"		return f_highLevelSelect;
"faceDefMesh"			return ef_faceDefMesh;
"faceDefTransform"		return ef_faceDefTransform;

"fieldId"			return f_fieldId;
"rotationDef"			return f_rotationDef;
"scaleDef"			return f_scaleDef;
"translationDef"		return f_translationDef;

"viseme"			return ef_viseme;
"expression" 			return ef_expression;
"open_jaw" 			return ef_open_jaw;
"lower_t_midlip" 		return ef_lower_t_midlip;
"raise_b_midlip" 		return ef_raise_b_midlip;
"stretch_l_corner" 		return ef_stretch_l_corner;
"stretch_r_corner" 		return ef_stretch_r_corner;
"lower_t_lip_lm" 		return ef_lower_t_lip_lm;
"lower_t_lip_rm" 		return ef_lower_t_lip_rm;
"lower_b_lip_lm" 		return ef_lower_b_lip_lm;
"lower_b_lip_rm" 		return ef_lower_b_lip_rm;
"raise_l_cornerlip" 		return ef_raise_l_cornerlip;
"raise_r_cornerlip" 		return ef_raise_r_cornerlip;
"thrust_jaw" 			return ef_thrust_jaw;
"shift_jaw" 			return ef_shift_jaw;
"push_t_lip"			return ef_push_t_lip;
"push_b_lip"			return ef_push_b_lip;
"depress_chin" 			return ef_depress_chin;
"close_t_l_eyelid" 		return ef_close_t_l_eyelid;
"close_t_r_eyelid" 		return ef_close_t_r_eyelid;
"close_b_l_eyelid" 		return ef_close_b_l_eyelid;
"close_b_r_eyelid" 		return ef_close_b_r_eyelid;
"yaw_l_eyeball" 		return ef_yaw_l_eyeball;
"yaw_r_eyeball" 		return ef_yaw_r_eyeball;
"pitch_l_eyeball" 		return ef_pitch_l_eyeball;
"pitch_r_eyeball" 		return ef_pitch_r_eyeball;
"thrust_l_eyeball" 		return ef_thrust_l_eyeball;
"thrust_r_eyeball" 		return ef_thrust_r_eyeball;
"dilate_l_pupil" 		return ef_dilate_l_pupil;
"dilate_r_pupil" 		return ef_dilate_r_pupil;
"raise_l_i_eyebrow" 		return ef_raise_l_i_eyebrow;
"raise_r_i_eyebrow" 		return ef_raise_r_i_eyebrow;
"raise_l_m_eyebrow" 		return ef_raise_l_m_eyebrow;
"raise_r_m_eyebrow" 		return ef_raise_r_m_eyebrow;
"raise_l_o_eyebrow" 		return ef_raise_l_o_eyebrow;
"raise_r_o_eyebrow" 		return ef_raise_r_o_eyebrow;
"sqeeze_l_eyebrow" 		return ef_sqeeze_l_eyebrow;
"sqeeze_r_eyebrow" 		return ef_sqeeze_r_eyebrow;
"pull_l_cheek" 			return ef_puff_l_cheek;
"pull_r_cheek" 			return ef_puff_r_cheek;
"lift_l_cheek" 			return ef_lift_l_cheek;
"lift_r_cheek" 			return ef_lift_r_cheek;
"shift_tongue_tip" 		return ef_shift_tongue_tip;
"raise_tongue_tip" 		return ef_raise_tongue_tip;
"thrust_tongue_tip" 		return ef_thrust_tongue_tip;
"raise_tongue "			return ef_raise_tongue;
"tongue_roll" 			return ef_tongue_roll;
"head_pitch" 			return ef_head_pitch;
"head_yaw" 			return ef_head_yaw;
"head_roll" 			return ef_head_roll;
"lower_t_lip_lm_o" 		return ef_lower_t_lip_lm_o;
"lower_t_lip_rm_o" 		return ef_lower_t_lip_rm_o;
"raise_b_lip_lm_o" 		return ef_raise_b_lip_lm_o;
"raise_b_lip_rm_o" 		return ef_raise_b_lip_rm_o;
"raise_l_cornerlib_o" 		return ef_raise_l_cornerlib_o;
"stretch_l_nose" 		return ef_stretch_l_nose;
"stretch_r_nose" 		return ef_stretch_r_nose;
"raise_nose" 			return ef_raise_nose;
"bend_nose" 			return ef_bend_nose;
"raise_l_ear" 			return ef_raise_l_ear;
"raise_r_ear" 			return ef_raise_r_ear;
"pull_l_ear" 			return ef_pull_l_ear;
"pull_r_ear" 			return ef_pull_r_ear;

"featurePointsCoord "		return ef_featurePointsCoord;
"textureCoords "		return ef_textureCoords;
"useOrthoTexture "		return ef_useOrthoTexture;
"faceDefTables "		return ef_faceDefTables;
"faceSceneGraph "		return ef_faceSceneGraph;

[[:alnum:]]{2,}			|
.{1,1}				{
				fprintf(stderr, "line %i: unknown token \"%s\"\n" , line, yytext);
				return -1;
				}
%%

