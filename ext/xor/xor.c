#include <stdio.h>
#include <ruby.h>

/* Backward compatibility with Ruby 1.8 */
#ifndef RSTRING_PTR
#define RSTRING_PTR(s) (RSTRING(s)->ptr)
#endif
#ifndef RSTRING_LEN
#define RSTRING_LEN(s) (RSTRING(s)->len)
#endif

VALUE string_xor( int argc, VALUE *argv, VALUE self ) {
  const char *src = 0;
  const char *src2 = 0;
  char *dest = 0 ;
  size_t length = 0;
  size_t l;

  if ( (argc < 1) || (argc > 2) ) {
    rb_raise( rb_eArgError, "wrong # of arguments(%d for 1 or 2)", argc );
    return Qnil;
  }

  rb_str_modify(self);
  dest = RSTRING_PTR(self);
  length = RSTRING_LEN(self);

  if ( TYPE(argv[0]) == T_STRING ) {
    l = RSTRING_LEN(argv[0]);
    src = RSTRING_PTR(argv[0]);
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
    if ( TYPE(argv[1]) == T_STRING ) {
      l = RSTRING_LEN(argv[1]);
      src2 = RSTRING_PTR(argv[1]);
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
