#version 300 es
uniform highp vec4 fxaaQualityRcpFrame;
in highp vec4 POSITION;
in highp vec2 TEXCOORD0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec4 xlv_TEXCOORD2;
void main ()
{
highp vec3 vPos_1;
highp vec4 tmpvar_2;
highp vec4 tmpvar_3;
vPos_1.xz = POSITION.xz;
vPos_1.y = (1.0 - POSITION.y);
highp vec4 tmpvar_4;
tmpvar_4.w = 1.0;
tmpvar_4.xy = ((vPos_1.xy * 2.0) - 1.0);
tmpvar_4.z = vPos_1.z;
tmpvar_2.xy = (TEXCOORD0 - fxaaQualityRcpFrame.xy);
tmpvar_2.zw = (TEXCOORD0 + (fxaaQualityRcpFrame.xy * vec2(1.0, -1.0)));
tmpvar_3.xy = (TEXCOORD0 + (fxaaQualityRcpFrame.xy * vec2(-1.0, 1.0)));
tmpvar_3.zw = (TEXCOORD0 + fxaaQualityRcpFrame.xy);
gl_Position.xyw = tmpvar_4.xyw;
xlv_TEXCOORD0 = TEXCOORD0;
xlv_TEXCOORD1 = tmpvar_2;
xlv_TEXCOORD2 = tmpvar_3;
gl_Position.z = ((POSITION.z * 2.0) - 1.0);
}
 
 