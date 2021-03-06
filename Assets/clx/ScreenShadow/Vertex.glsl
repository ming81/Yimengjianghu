#version 300 es
uniform highp mat4 ViewProjVS;
uniform highp mat4 cWorld;
in highp vec3 POSITION;
void main ()
{
highp vec4 tmpvar_1;
highp vec4 tmpvar_2;
tmpvar_2.w = 1.0;
tmpvar_2.xyz = POSITION;
highp vec4 tmpvar_3;
tmpvar_3.w = 1.0;
tmpvar_3.xyz = (tmpvar_2 * cWorld).xyz;
tmpvar_1 = (tmpvar_3 * ViewProjVS);
tmpvar_1.z = min (tmpvar_1.z, tmpvar_1.w);
gl_Position.xyw = tmpvar_1.xyw;
gl_Position.z = ((tmpvar_1.z * 2.0) - tmpvar_1.w);
}
 
 