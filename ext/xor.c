#include <stdio.h>
#include <ruby.h>

VALUE string_xor( int argc, VALUE *argv, VALUE self ) {
  const char *src = 0;
  char *dest = 0 ;
  size_t length = 0;

  if ( (argc < 1) || (argc > 2) ) {
    rb_raise( rb_eArgError, "wrong # of arguments(%d for 1 or 2)", argc );
    return Qnil;
  }

  dest = STR2CSTR(self);
  length = RSTRING(self)->len;

  if ( TYPE(argv[0]) == T_STRING ) {
    src = STR2CSTR(argv[0]);
    size_t l = RSTRING(argv[0])->len;
    if ( l < length )
      length = l;
  } else {
    rb_raise( rb_eTypeError, "in method '" "xor" "', argument " "1"" of type '" "String""'" );
    return Qnil;
  }

  if ( argc == 1 ) {
    for ( ; length--; ++dest, ++src )
      *dest ^= *src;

  } else {
    const char *src2 = 0;

    if ( TYPE(argv[1]) == T_STRING ) {
      src2 = STR2CSTR(argv[1]);
      size_t l = RSTRING(argv[1])->len;
      if ( l < length )
        length = l;
    } else {
      rb_raise( rb_eTypeError, "in method '" "xor" "', argument " "2"" of type '" "String""'" );
      return Qnil;
    }

    for ( ; length--; ++dest, ++src, ++src2 )
      *dest ^= *src ^ *src2;
  }

  return self;
}


void Init_xor( void )
{
  rb_define_method( rb_cString, "xor!", ((VALUE (*)(ANYARGS)) string_xor), -1 );
}
