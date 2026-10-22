package openfl.utils._internal;

#if lime
typedef Int32Array = lime.utils.Int32Array;
#elseif js
typedef Int32Array = js.lib.Int32Array;
#else
typedef Int32Array = Dynamic;
#end
