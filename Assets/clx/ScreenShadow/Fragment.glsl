#version 300 es
uniform highp vec4 CameraPosPS;
uniform highp vec4 ScreenInfoPS;
uniform highp vec4 cWBasisX;
uniform highp vec4 cWBasisY;
uniform highp vec4 cWBasisZ;
uniform highp mat4 cShadowViewProjTex;
uniform highp float cFilterRadius;
uniform highp float cInvShadowMapSize;
uniform highp sampler2D sDepthSampler;
uniform highp sampler2D sShadowSampler;
out highp vec4 SV_Target;
void main ()
{
highp vec4 tmpvar_1;
highp vec3 sampleDepth3_2;
highp vec3 sampleDepth2_3;
highp vec3 sampleDepth1_4;
mediump vec2 fraction_5;
mediump float InShadow_6;
highp vec4 P_LS_7;
highp vec2 screenPos_8;
screenPos_8.x = gl_FragCoord.x;
screenPos_8.y = (ScreenInfoPS.y - gl_FragCoord.y);
highp vec4 tmpvar_9;
tmpvar_9.w = 1.0;
tmpvar_9.xyz = (CameraPosPS.xyz + ((
(cWBasisZ.xyz + (cWBasisX.xyz * gl_FragCoord.x))
+
(cWBasisY.xyz * screenPos_8.y)
) * dot (texture (sDepthSampler,
(gl_FragCoord.xy * ScreenInfoPS.zw)
), vec4(1.0, 0.003921569, 1.53787e-5, 6.030863e-8))));
highp vec4 tmpvar_10;
tmpvar_10 = (tmpvar_9 * cShadowViewProjTex);
P_LS_7.w = tmpvar_10.w;
P_LS_7.xyz = (tmpvar_10.xyz / tmpvar_10.w);
highp float tmpvar_11;
tmpvar_11 = min (0.99999, P_LS_7.z);
highp vec2 tmpvar_12;
tmpvar_12 = ((P_LS_7.xy / vec2(cInvShadowMapSize)) - 0.5);
highp vec2 tmpvar_13;
tmpvar_13 = fract(tmpvar_12);
fraction_5 = tmpvar_13;
highp vec2 tmpvar_14;
tmpvar_14 = ((floor(tmpvar_12) + 0.5) * vec2(cInvShadowMapSize));
sampleDepth1_4.x = dot (texture (sShadowSampler, tmpvar_14), vec4(1.0, 0.003921569, 1.53787e-5, 6.030863e-8));
sampleDepth1_4.y = dot (texture (sShadowSampler, ((vec2(1.0, 0.0) * vec2(cInvShadowMapSize)) + tmpvar_14)), vec4(1.0, 0.003921569, 1.53787e-5, 6.030863e-8));
sampleDepth1_4.z = dot (texture (sShadowSampler, ((vec2(2.0, 0.0) * vec2(cInvShadowMapSize)) + tmpvar_14)), vec4(1.0, 0.003921569, 1.53787e-5, 6.030863e-8));
sampleDepth2_3.x = dot (texture (sShadowSampler, ((vec2(0.0, 1.0) * vec2(cInvShadowMapSize)) + tmpvar_14)), vec4(1.0, 0.003921569, 1.53787e-5, 6.030863e-8));
sampleDepth2_3.y = dot (texture (sShadowSampler, (vec2(cInvShadowMapSize) + tmpvar_14)), vec4(1.0, 0.003921569, 1.53787e-5, 6.030863e-8));
sampleDepth2_3.z = dot (texture (sShadowSampler, ((vec2(2.0, 1.0) * vec2(cInvShadowMapSize)) + tmpvar_14)), vec4(1.0, 0.003921569, 1.53787e-5, 6.030863e-8));
sampleDepth3_2.x = dot (texture (sShadowSampler, ((vec2(0.0, 2.0) * vec2(cInvShadowMapSize)) + tmpvar_14)), vec4(1.0, 0.003921569, 1.53787e-5, 6.030863e-8));
sampleDepth3_2.y = dot (texture (sShadowSampler, ((vec2(1.0, 2.0) * vec2(cInvShadowMapSize)) + tmpvar_14)), vec4(1.0, 0.003921569, 1.53787e-5, 6.030863e-8));
sampleDepth3_2.z = dot (texture (sShadowSampler, ((vec2(2.0, 2.0) * vec2(cInvShadowMapSize)) + tmpvar_14)), vec4(1.0, 0.003921569, 1.53787e-5, 6.030863e-8));
mediump vec3 tmpvar_15;
highp vec3 tmpvar_16;
tmpvar_16 = clamp (((
(sampleDepth1_4 - vec3(tmpvar_11))
* cFilterRadius) + 1.0), 0.0, 1.0);
tmpvar_15 = tmpvar_16;
mediump vec3 tmpvar_17;
highp vec3 tmpvar_18;
tmpvar_18 = clamp (((
(sampleDepth2_3 - vec3(tmpvar_11))
* cFilterRadius) + 1.0), 0.0, 1.0);
tmpvar_17 = tmpvar_18;
mediump vec3 tmpvar_19;
highp vec3 tmpvar_20;
tmpvar_20 = clamp (((
(sampleDepth3_2 - vec3(tmpvar_11))
* cFilterRadius) + 1.0), 0.0, 1.0);
tmpvar_19 = tmpvar_20;
mediump vec3 tmpvar_21;
tmpvar_21.x = tmpvar_15.x;
tmpvar_21.y = tmpvar_17.x;
tmpvar_21.z = tmpvar_19.x;
mediump vec3 tmpvar_22;
tmpvar_22.x = tmpvar_15.y;
tmpvar_22.y = tmpvar_17.y;
tmpvar_22.z = tmpvar_19.y;
mediump vec3 tmpvar_23;
tmpvar_23 = ((tmpvar_21 * (1.0 - fraction_5.xxx)) + (tmpvar_22 * fraction_5.xxx));
mediump vec3 tmpvar_24;
tmpvar_24.x = tmpvar_15.y;
tmpvar_24.y = tmpvar_17.y;
tmpvar_24.z = tmpvar_19.y;
mediump vec3 tmpvar_25;
tmpvar_25.x = tmpvar_15.z;
tmpvar_25.y = tmpvar_17.z;
tmpvar_25.z = tmpvar_19.z;
mediump vec3 tmpvar_26;
tmpvar_26 = ((tmpvar_24 * (1.0 - fraction_5.xxx)) + (tmpvar_25 * fraction_5.xxx));
InShadow_6 = ((tmpvar_23.x * (1.0 - fraction_5.y)) + (tmpvar_23.y * fraction_5.y));
InShadow_6 = (InShadow_6 + ((tmpvar_23.y *
(1.0 - fraction_5.y)
) + (tmpvar_23.z * fraction_5.y)));
InShadow_6 = (InShadow_6 + ((tmpvar_26.x *
(1.0 - fraction_5.y)
) + (tmpvar_26.y * fraction_5.y)));
InShadow_6 = (InShadow_6 + ((tmpvar_26.y *
(1.0 - fraction_5.y)
) + (tmpvar_26.z * fraction_5.y)));
InShadow_6 = (InShadow_6 * 0.25);
mediump vec4 tmpvar_27;
tmpvar_27.yzw = vec3(1.0, 0.0, 0.0);
tmpvar_27.x = (1.0 - InShadow_6);
tmpvar_1 = tmpvar_27;
SV_Target = tmpvar_1;
}
 
 