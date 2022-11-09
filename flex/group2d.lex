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
*  group2d.lex
*  Created by Nico Petri on 10.06.2000.
*/

%{
#include "../clang/header/group2d.h"
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

"Group2D"			{zzlval.INT = n_Group2D; return n_Group2D;}
"WorldInfo"			{zzlval.INT = n_WorldInfo; return n_WorldInfo;}

"AnimationStream"		{zzlval.INT = n_AnimationStream; return n_AnimationStream;}
"Appearance"			{zzlval.INT = n_Appearance; return n_Appearance;}
"AudioDelay"			{zzlval.INT = n_AudioDelay; return n_AudioDelay;}
"AudioFX"			{zzlval.INT = n_AudioFX; return n_AudioFX;}
"AudioMix"			{zzlval.INT = n_AudioMix; return n_AudioMix;}
"AudioSource"			{zzlval.INT = n_AudioSource; return n_AudioSource;}
"AudioSwitch"			{zzlval.INT = n_AudioSwitch; return n_AudioSwitch;}
"Box"				{zzlval.INT = n_Box; return n_Box;}
"Circle"			{zzlval.INT = n_Circle; return n_Circle;}
"Color"				{zzlval.INT = n_Color; return n_Color;}
"ColorInterpolator"		{zzlval.INT = n_ColorInterpolator; return n_ColorInterpolator;}
"Conditional"			{zzlval.INT = n_Conditional; return n_Conditional;}
"Cone"				{zzlval.INT = n_Cone; return n_Cone;}
"Coordinate2D"			{zzlval.INT = n_Coordinate2D; return n_Coordinate2D;}
"CoordinateInterpolator"	{zzlval.INT = n_CoordinateInterpolator; return n_CoordinateInterpolator;}
"Cylinder"			{zzlval.INT = n_Cylinder; return n_Cylinder;}
"DiscSensor"			{zzlval.INT = n_DiscSensor; return n_DiscSensor;}
"FontStyle"			{zzlval.INT = n_FontStyle; return n_FontStyle;}
"Form"				{zzlval.INT = n_Form; return n_Form;}
"Image2D"			{zzlval.INT = n_Image2D; return n_Image2D;}
"ImageTexture"			{zzlval.INT = n_ImageTexture; return n_ImageTexture;}
"IndexedFaceSet2D"		{zzlval.INT = n_IndexedFaceSet2D; return n_IndexedFaceSet2D;}
"IndexedLineSet2D"		{zzlval.INT = n_IndexedLineSet2D; return n_IndexedLineSet2D;}
"Inline2D"			{zzlval.INT = n_Inline2D; return n_Inline2D;}
"Layout"			{zzlval.INT = n_Layout; return n_Layout;}
"LineProperties"		{zzlval.INT = n_LineProperties; return n_LineProperties;}
"Material2D"			{zzlval.INT = n_MovieTexture; return n_Material2D;}
"MovieTexture"			{zzlval.INT = n_MovieTexture; return n_MovieTexture;}
"PointSet2D"			{zzlval.INT = n_PointSet2D; return n_PointSet2D;}
"Position2DInterpolator"	{zzlval.INT = n_Position2DInterpolator; return n_Position2DInterpolator;}
"Rectangle"			{zzlval.INT = n_Rectangle; return n_Rectangle;}
"ScalarInterpolator"		{zzlval.INT = n_ScalarInterpolator; return n_ScalarInterpolator;}
"Shape"				{zzlval.INT = n_Shape; return n_Shape;}
"Sound2D"			{zzlval.INT = n_Sound2D; return n_Sound2D;}
"Sphere"			{zzlval.INT = n_Sphere; return n_Sphere;}
"Switch2D"			{zzlval.INT = n_Switch2D; return n_Switch2D;}
"Text"				{zzlval.INT = n_Text; return n_Text;}
"TextureCoordinate"		{zzlval.INT = n_TextureCoordinate; return n_TextureCoordinate;}
"TextureTransform"		{zzlval.INT = n_TextureTransform; return n_TextureTransform;}
"TimeSensor"			{zzlval.INT = n_TimeSensor; return n_TimeSensor;}
"TouchSensor"			{zzlval.INT = n_TouchSensor; return n_TouchSensor;}
"Transform2D"			{zzlval.INT = n_Transform2D; return n_Transform2D;}


"appearance"			return ef_appearance;
"autoOffset"			return ef_autoOffset;
"buffer"			return ef_buffer;
"center"			return ef_center;
"children"			return ef_children;
"choice"			return ef_choice;
"color"				return ef_color;
"constraint"			return ef_constraint;
"coord"				return ef_coord;
"cycleInterval"			return ef_cycleInterval;
"delay"				return ef_delay;
"drawingOrder"			return ef_drawingOrder;
"emissiveColor"			return ef_emissiveColor;
"enabled"			return ef_enabled;
"filled"			return ef_filled;
"fontStyle"			return ef_fontStyle; 
"geometry"			return ef_geometry;
"groups"			return ef_groups;
"groupsIndex"			return ef_groupsIndex;
"horizontal"			return ef_horizontal;
"intensity"			return ef_intensity;
"justify"			return ef_justify;
"key"				return ef_key;
"keyValue"			return ef_keyValue;
"leftToRight"			return ef_leftToRight;
"length"			return ef_length;
"lineColor"			return ef_lineColor;
"lineProps"			return ef_lineProps;
"lineStyle"			return ef_lineStyle;
"location"			return ef_location;
"loop"				return ef_loop;
"material"			return ef_material;
"matrix"			return ef_matrix;
"maxAngle"			return ef_maxAngle;
"maxExtent"			return ef_maxExtent;
"minAngle"			return ef_minAngle;
"numInputs"			return ef_numInputs;
"orch"				return ef_orch;
"params"			return ef_params;
"pitch"				return ef_pitch;
"point"				return ef_point;
"radius"			return ef_radius;
"rotation"			return ef_rotation;
"rotationAngle"			return ef_rotationAngle;
"scale"				return ef_scale;
"scaleOrientation"		return ef_scaleOrientation;
"score"				return ef_score;
"scrollRate"			return ef_scrollRate;
"scrollVertical"		return ef_scrollVertical;
"size"				return ef_size;
"smothScroll"			return ef_smothScroll;
"source"			return ef_source;
"spacing"			return ef_spacing;
"speed"				return ef_speed;
"startTime"			return ef_startTime;
"stopTime"			return ef_stopTime;
"string"			return ef_string;
"texCoord"			return ef_texCoord;
"texture"			return ef_texture;
"textureTransform"		return ef_textureTransform;
"topToBottom"			return ef_topToBottom;
"translation"			return ef_translation;
"transparency"			return ef_transparency;
"url"				{
				BEGIN(URL);
				return ef_url;
				}
"wichChoice"			return ef_wichChoice;
"width"				return ef_width;
"wrap"				return ef_wrap;

"activate"			return ei_activate;
"addChildren"			return ei_addChildren;
"removeChildren"		return ei_removeChildren;
"reverseActivate"		return ei_reverseActivate;
"set_colorIndex"		return ei_set_colorIndex;
"set_coordIndex"		return ei_set_coordIndex;
"set_fraction"			return ei_set_fraction;
"set_texCoordIndex"		return ei_set_texCoordIndex;



"bboxCenter"			return f_bboxCenter;
"bboxSize"			return f_bboxSize;
"botoom"			return f_bottom;
"bottomRadius"			return f_bottomRadius;
"colorIndex"			return f_colorIndex;
"colorPerVertex"		return f_colorPerVertex;
"convex"			return f_convex;
"coordIndex"			return f_coordIndex;
"family"			return f_family;
"height"			return f_height;
"info"				return f_info;
"language"			return f_language;
"numChan"			return f_numChan;
"phaseGroup"			return f_phaseGroup;
"repeatS"			return f_repeatS;
"repeatT"			return f_repeatT;
"side"				return f_side;
"spatialize"			return f_spatialize;
"style"				return f_style;
"texCoordIndex"			return f_texCoordIndex;
"title"				{
				BEGIN(STRING);
				return f_title;
				}
"top"				return f_top;



"cycleTime"			return eo_cycleTime;
"duration_changed"		return eo_duration_changed;
"fraction_changed"		return eo_fraction_changed;
"hitNormal_changed"		return eo_hitNormal_changed;
"hitPoint_changed"		return eo_hitPoint_changed;
"hitTexCoord_changed"		return eo_hitTexCoord_changed;
"isActive"			return eo_isActive;
"isOver"			return eo_isOver;
"rotation_changed"		return eo_rotation_changed;
"time "				return eo_time;
"touchTime"			return eo_touchTime;
"trackPoint_changed"		return eo_trackPoint_changed;
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
				zzlval.STR = (char *) strdup(zztext);
				BEGIN(0);
				return kw_Identifier;
				}
<RESTORE_ID>[\n]{1,}		++line;
<RESTORE_ID>[[:blank:]]+
<RESTORE_ID>[A-Za-z0-9]+	{
				poped_number = pop_node_data( (char *) strdup(zztext) );
				if( poped_number == 0) 
				fprintf(stderr, "line %i: syntax error; using unknown identifier \"%s\" \n" , line, zztext);
				BEGIN(0);
				return poped_number; 
				}
<ROUTE_DEF>[\n]{1,}		++line;
<ROUTE_DEF>[[:blank:]]+		
<ROUTE_DEF>[A-Za-z0-9]+		{
				zzlval.STR = (char *) strdup(zztext);
				BEGIN(RESTORE_ID);
				return kw_Identifier;
				}
<URL>[\n]{1,}			++line;
<URL>[[:blank:]]+		
<URL>\"				
<URL>{FILE_NAME}		|
<URL>[A-Za-z]+			|		
<URL>[0-9]+			{
				zzlval.STR = (char *) strdup(zztext);
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

[[:alnum:]]{2,}			|
.{1,1}				{
				fprintf(stderr, "line %i: unknown token \"%s\"\n" , line, yytext);
				return -1;
				}
%%
