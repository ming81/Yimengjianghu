#version 300 es
uniform highp vec3 cBloomTint;
uniform highp sampler2D SourceLinear0_Sampler;
uniform highp sampler2D sBloomSampler0;
uniform highp sampler2D sBloomSampler1;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec4 xlv_TEXCOORD2;
out highp vec4 SV_Target;
void main ()
{
mediump vec3 vScene2_1;
mediump vec3 cBloom1_2;
mediump vec3 cBloom0_3;
highp vec4 tmpvar_4;
highp vec4 tmpvar_5;
tmpvar_5 = texture (SourceLinear0_Sampler, xlv_TEXCOORD0);
tmpvar_4.w = tmpvar_5.w;
highp vec3 tmpvar_6;
tmpvar_6 = texture (sBloomSampler0, xlv_TEXCOORD0).xyz;
cBloom0_3 = tmpvar_6;
highp vec3 tmpvar_7;
tmpvar_7 = texture (sBloomSampler1, xlv_TEXCOORD0).xyz;
cBloom1_2 = tmpvar_7;
highp vec3 tmpvar_8;
tmpvar_8 = tmpvar_5.xyz;
vScene2_1 = tmpvar_8;
tmpvar_4.xyz = (tmpvar_5.xyz * tmpvar_5.xyz);
tmpvar_4.xyz = (tmpvar_4.xyz + ((
((cBloom0_3 * cBloom0_3) + (cBloom1_2 * cBloom1_2))
* cBloomTint) * (1.0 - vScene2_1)));
tmpvar_4.xyz = sqrt(tmpvar_4.xyz);
tmpvar_4.w = 1.0;
SV_Target = tmpvar_4;
}

 
 