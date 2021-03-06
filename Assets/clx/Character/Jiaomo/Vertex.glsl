#version 300 es
uniform highp mat4 ViewProjVS;
uniform highp vec4 CameraPosVS;
uniform highp mat4 LightViewProjTex;
uniform highp vec4 FogInfo;
uniform highp vec4 SkeletonData[192];
uniform highp mat4 World;
in highp vec4 POSITION;
in highp vec4 NORMAL;
in highp vec2 TEXCOORD0;
in highp vec4 TANGENT;
in highp vec4 BINORMAL;
in highp vec4 BLENDWEIGHT;
in highp  vec4 BLENDINDICES;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec4 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
out highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = POSITION.xyz;
  tmpvar_1 = ((NORMAL.xyz * 2.0) - 1.0);
  highp vec4 tmpvar_3;
  tmpvar_3.w = tmpvar_2.w;
  highp int idx_4;
  idx_4 = int(BLENDINDICES.x);
  highp int idx_5;
  idx_5 = int(BLENDINDICES.y);
  highp int idx_6;
  idx_6 = int(BLENDINDICES.z);
  highp int idx_7;
  idx_7 = int(BLENDINDICES.w);
  highp vec4 tmpvar_8;
  tmpvar_8 = (((
    (BLENDWEIGHT.x * SkeletonData[(3 * idx_4)])
   + 
    (BLENDWEIGHT.y * SkeletonData[(3 * idx_5)])
  ) + (BLENDWEIGHT.z * SkeletonData[
    (3 * idx_6)
  ])) + (BLENDWEIGHT.w * SkeletonData[(3 * idx_7)]));
  highp vec4 tmpvar_9;
  tmpvar_9 = (((
    (BLENDWEIGHT.x * SkeletonData[((3 * idx_4) + 1)])
   + 
    (BLENDWEIGHT.y * SkeletonData[((3 * idx_5) + 1)])
  ) + (BLENDWEIGHT.z * SkeletonData[
    ((3 * idx_6) + 1)
  ])) + (BLENDWEIGHT.w * SkeletonData[(
    (3 * idx_7)
   + 1)]));
  highp vec4 tmpvar_10;
  tmpvar_10 = (((
    (BLENDWEIGHT.x * SkeletonData[((3 * idx_4) + 2)])
   + 
    (BLENDWEIGHT.y * SkeletonData[((3 * idx_5) + 2)])
  ) + (BLENDWEIGHT.z * SkeletonData[
    ((3 * idx_6) + 2)
  ])) + (BLENDWEIGHT.w * SkeletonData[(
    (3 * idx_7)
   + 2)]));
  highp vec3 tmpvar_11;
  tmpvar_11.x = dot (tmpvar_8.xyz, POSITION.xyz);
  tmpvar_11.y = dot (tmpvar_9.xyz, POSITION.xyz);
  tmpvar_11.z = dot (tmpvar_10.xyz, POSITION.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12.x = tmpvar_8.w;
  tmpvar_12.y = tmpvar_9.w;
  tmpvar_12.z = tmpvar_10.w;
  tmpvar_3.xyz = (tmpvar_11 + tmpvar_12);
  highp vec3 tmpvar_13;
  tmpvar_13.x = dot (tmpvar_8.xyz, tmpvar_1);
  tmpvar_13.y = dot (tmpvar_9.xyz, tmpvar_1);
  tmpvar_13.z = dot (tmpvar_10.xyz, tmpvar_1);
  highp vec4 tmpvar_14;
  highp vec4 tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = tmpvar_3.xyz;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = (tmpvar_16 * World).xyz;
  highp mat3 tmpvar_18;
  tmpvar_18[uint(0)] = World[uint(0)].xyz;
  tmpvar_18[1u] = World[1u].xyz;
  tmpvar_18[2u] = World[2u].xyz;
  tmpvar_14.xyz = normalize((tmpvar_13 * tmpvar_18));
  tmpvar_15.xyz = (tmpvar_17.xyz - CameraPosVS.xyz);
  highp float fHeightCoef_19;
  highp float tmpvar_20;
  tmpvar_20 = clamp (((tmpvar_17.y * FogInfo.z) + FogInfo.w), 0.0, 1.0);
  fHeightCoef_19 = (tmpvar_20 * tmpvar_20);
  fHeightCoef_19 = (fHeightCoef_19 * fHeightCoef_19);
  highp float tmpvar_21;
  tmpvar_21 = (1.0 - exp((
    -(max (0.0, (sqrt(
      dot (tmpvar_15.xyz, tmpvar_15.xyz)
    ) - FogInfo.x)))
   * 
    max ((FogInfo.y * fHeightCoef_19), (0.1 * FogInfo.y))
  )));
  tmpvar_15.w = (tmpvar_21 * tmpvar_21);
  highp vec4 tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.xyz = tmpvar_14.xyz;
  tmpvar_23.w = 0.0;
  highp vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = tmpvar_17.xyz;
  tmpvar_22 = (tmpvar_24 * ViewProjVS);
  tmpvar_14 = tmpvar_23;
  gl_Position.xyw = tmpvar_22.xyw;
  xlv_TEXCOORD0 = TEXCOORD0.xyxy;
  xlv_TEXCOORD1 = tmpvar_17;
  xlv_TEXCOORD2 = tmpvar_23;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = (tmpvar_17 * LightViewProjTex);
  gl_Position.z = ((tmpvar_22.z * 2.0) - tmpvar_22.w);
}

 