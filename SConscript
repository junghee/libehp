
import os

Import('env')

env.Replace(debug=ARGUMENTS.get("debug",0))
if int(env['debug']) == 1:
        print "Setting debug mode"
        env.Append(CFLAGS=" -g ")
        env.Append(CXXFLAGS=" -g ")
        env.Append(LINKFLAGS=" -g ")
else:
        print "Setting release mode"
        env.Append(CFLAGS=" -O3 ")
        env.Append(CXXFLAGS=" -O3 ")
        env.Append(LINKFLAGS=" -O3 ")


lib=SConscript("src/SConscript")

Return('lib')

