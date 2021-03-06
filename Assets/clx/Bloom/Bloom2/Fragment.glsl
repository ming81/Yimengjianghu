#version 300 es
uniform highp vec4 psWeights[16];
uniform mediump sampler2D SourceLinear0_Sampler;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec4 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
out highp vec4 SV_Target;
void main ()
{
mediump vec4 sum_1;
highp vec4 tmpvar_2;
sum_1 = (texture (SourceLinear0_Sampler, xlv_TEXCOORD0.xy) * psWeights[0].x);
sum_1 = (sum_1 + (texture (SourceLinear0_Sampler, xlv_TEXCOORD0.zw) * psWeights[1].x));
sum_1 = (sum_1 + (texture (SourceLinear0_Sampler, xlv_TEXCOORD1.xy) * psWeights[2].x));
sum_1 = (sum_1 + (texture (SourceLinear0_Sampler, xlv_TEXCOORD1.zw) * psWeights[3].x));
sum_1 = (sum_1 + (texture (SourceLinear0_Sampler, xlv_TEXCOORD2.xy) * psWeights[4].x));
sum_1 = (sum_1 + (texture (SourceLinear0_Sampler, xlv_TEXCOORD2.zw) * psWeights[5].x));
sum_1 = (sum_1 + (texture (SourceLinear0_Sampler, xlv_TEXCOORD3.xy) * psWeights[6].x));
sum_1 = (sum_1 + (texture (SourceLinear0_Sampler, xlv_TEXCOORD3.zw) * psWeights[7].x));
tmpvar_2 = sum_1;
SV_Target = tmpvar_2;
}
 
 