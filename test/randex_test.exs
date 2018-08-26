defmodule RandexTest do
  use ExUnit.Case
  doctest Randex

  @cases [
    "",
    "$",
    "((((((((((a))))))))))",
    # "((((((((((a))))))))))\\10",
    "(((((((((a)))))))))",
    "(([a-z]+):)?([a-z]+)$",
    "((a)(b)c)(d)",
    "((a))",
    "((a)c)?(ab)$",
    "()\" 2],\"    [\"[^ab]*",
    "()ef",
    "(.*)c(.*)",
    # "(?<!-):(.*?)(?<!-):",
    # "(?<!\\\\):(.*?)(?<!\\\\):",
    "(?P<foo_123>a)",
    # "(?P<foo_123>a)(?P=foo_123)",
    # "(?P<id>aa)(?P=id)",
    "(?P<id>aaa)a",
    "(?'id'aaa)a",
    "(?<id>aaa)a",
    # "(?i)$",
    # "(?i)$b",
    # "(?i)((((((((((a))))))))))",
    # "(?i)((((((((((a))))))))))\\10",
    "(?i)(((((((((a)))))))))",
    "(?i)((a)(b)c)(d)",
    "(?i)((a))",
    "(?i)()ef",
    "(?i)(.*)c(.*)",
    "(?i)(?:(?:(?:(?:(?:(?:(?:(?:(?:(a))))))))))",
    "(?i)(?:(?:(?:(?:(?:(?:(?:(?:(?:(a|b|c))))))))))",
    # "(?i)([a-c]*)\\1",
    "(?i)([abc])*bcd",
    "(?i)([abc])*d",
    "(?i)(a)b(c)",
    "(?i)(a+|b)*",
    "(?i)(a+|b)+",
    "(?i)(a+|b)?",
    "(?i)(a+|b){0,1}",
    "(?i)(a+|b){0,1}?",
    "(?i)(a+|b){0,}",
    "(?i)(a+|b){1,}",
    # "(?i)(abc)\\1",
    "(?i)(abc|)ef",
    "(?i)(ab|a)b*c",
    "(?i)(ab|ab*)bc",
    "(?i)(ab|cd)e",
    "(?i)(a|b)c*d",
    "(?i)(a|b|c|d|e)f",
    "(?i)(bc+d$|ef*g.|h?i(j|k))",
    "(?i)[^ab]*",
    "(?i)[a-zA-Z_][a-zA-Z0-9_]*",
    "(?i)[abhgefdc]ij",
    "(?i)[k]",
    "(?i)\\((.*), (.*)\\)",
    "(?i)^",
    "(?i)^(ab|cd)e",
    "(?i)^a(bc+|b[eh])g|.h$",
    "(?i)^abc",
    "(?i)^abc$",
    "(?i)a([bc]*)(c*d)",
    "(?i)a([bc]*)(c+d)",
    "(?i)a([bc]*)c*",
    "(?i)a([bc]+)(c*d)",
    "(?i)a*",
    "(?i)a+b+c",
    "(?i)a.*?c",
    "(?i)a.*c",
    "(?i)a.+?c",
    "(?i)a.c",
    "(?i)a.{0,5}?c",
    "(?i)a[-]?c",
    "(?i)a[-b]",
    "(?i)a[]]b",
    # "(?i)a[^-b]c",
    # "(?i)a[^]b]c",
    # "(?i)a[^bc]d",
    "(?i)a[b-]",
    "(?i)a[b-d]",
    "(?i)a[b-d]e",
    "(?i)a[bc]d",
    "(?i)a[bcd]*dcdcde",
    "(?i)a[bcd]+dcdcde",
    "(?i)a\\(*b",
    "(?i)a\\(b",
    "(?i)a\\\\b",
    "(?i)a]",
    "(?i)ab*",
    "(?i)ab*?bc",
    "(?i)ab*bc",
    "(?i)ab*c",
    "(?i)ab+?bc",
    "(?i)ab+bc",
    "(?i)ab??bc",
    "(?i)ab??c",
    "(?i)abc",
    "(?i)abc$",
    "(?i)abcd*efg",
    "(?i)ab{0,1}?bc",
    "(?i)ab{0,1}?c",
    "(?i)ab{0,}?bc",
    "(?i)ab{1,3}?bc",
    "(?i)ab{1,}?bc",
    "(?i)ab{1,}bc",
    "(?i)ab{3,4}?bc",
    "(?i)ab{4,5}?bc",
    "(?i)ab|cd",
    "(?i)a{1,}b{1,}c",
    "(?i)a|b|c|d|e",
    "(?i)multiple words of text",
    "(?i)multiple words",
    "(?m)^abc",
    "(?m)abc$",
    "(?im-sx)abc",
    "(?s)a.b",
    "(?s)a.{,5}b",
    "(?x)foo ",
    "(?x)w# comment 1\n",
    "(?x)w# comment 1\nabc#comment 2\ncba",
    "(?x)w# comment 1\n        x y\n        # comment 2\n        z",
    "(?x)w\\##comment\n",
    "hello#comment",
    "([\\s]*)([\\S]*)([\\s]*)",
    "([^.]*)\\.([^:]*):[T ]+(.*)",
    "([^/]*/)*sub1/",
    "([^N]*N)+",
    # "([a-c]*)\\1",
    # "([a-c]+)\\1",
    # "([ab]*?)(?!(b))c",
    # "([ab]*?)(?<!(a))",
    # "([ab]*?)(?=(b)?)c",
    "([abc])*bcd",
    "([abc])*d",
    # "([abc]*)\\1",
    "([abc]*)x",
    "([ac])+x",
    "([xyz]*)x",
    "(\\s*)(\\S*)(\\s*)",
    # "(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)(k)(l)\\119",
    "(a)(b)c|ab",
    "(a)+b|aac",
    "(a)+x",
    # "(a).+\\1",
    # "(a)\\1",
    "(a)b(c)",
    # "(a)ba*\\1",
    # "(a+)+\\1",
    # "(a+).\\1$",
    # "(a+)\\1",
    # "(a+)a\\1$",
    "(a+b)*",
    "(a+|){,}",
    "(a+|b)*",
    "(a+|b)+",
    "(a+|b)?",
    "(a+|b){,1}",
    "(a+|b){,}",
    # "(aa|a)a\\1$",
    # "(abc)\\1",
    "(abc|)ef",
    "(ab|a)b*c",
    "(ab|ab*)bc",
    "(ab|cd)e",
    # "(a|aa)a\\1$",
    "(a|b)c*d",
    "(a|b|c|d|e)f",
    "(bc+d$|ef*g.|h?i(j|k))",
    "(x?)?",
    ".*?$",
    ".*d",
    "[ ]*?\\ (\\d+).*",
    "[\\0a]",
    "[\\1]",
    # "[\\41]",
    "[\\D]+",
    "[\\a][\\b][\\f][\\n][\\r][\\t][\\v]",
    "[\\da-fA-F]+",
    "[\\t][\\n][\\v][\\r][\\f][\\b]",
    "[\\w]+",
    "[^>]*?b",
    "[^a\\0]",
    "[^ab]*",
    "[a-zA-Z_][a-zA-Z0-9_]*",
    "[a\\0]",
    "[abhgefdc]ij",
    "[k]",
    "\\((.*), (.*)\\)",
    "\\0",
    # "\\09",
    # "\\141",
    "\\Ba\\B",
    "\\Bx",
    "\\By\\B",
    "\\By\\b",
    "\\Bz",
    "\\D+",
    "\\a[\\b]\\f\\n\\r\\t\\v",
    "\\ba\\b",
    "\\by\\B",
    "\\by\\b",
    "\\t\\n\\v\\r\\f\\a",
    "\\w+",
    "\\w-]+",
    # "\\x00f",
    # "\\x00fe",
    # "\\x00ff",
    # "\\x00ffffffffffffff",
    # "\\xff",
    "^",
    "^(.+)?B",
    # "^(a+).\\1$",
    "^(ab|cd)e",
    "^\\w+=(\\\\[\\000-\\277]|[^\\n\\\\])*",
    "^a(bc+|b[eh])g|.h$",
    "^abc",
    "^abc$",
    # "a(?!b).",
    "a(?:b|(c|e){1,2}?|d)+?(.)",
    "a(?:b|c|d)(.)",
    "a(?:b|c|d)*(.)",
    "a(?:b|c|d)+?(.)",
    # "a(?=c|d).",
    # "a(?=d).",
    "a([bc]*)(c*d)",
    "a([bc]*)(c+d)",
    "a([bc]*)c*",
    "a([bc]+)(c*d)",
    "a*",
    "a*?$",
    "a+b+c",
    "a.*(?s)b",
    "a.*b",
    "a.*c",
    "a.+?c",
    "a.b",
    "a.b(?s)",
    "a.c",
    "a.{,5}b",
    "a[-]?c",
    "a[-b]",
    "a[\\-b]",
    "a[\\]]b",
    "a[]]b",
    "a[^-b]c",
    "a[^bc]d",
    "a[b-]",
    "a[b-d]",
    "a[b-d]e",
    "a[bc]d",
    "a[bcd]*dcdcde",
    "a[bcd]+dcdcde",
    "a\\(*b",
    "a\\(b",
    "a\\\\b",
    "a]",
    "ab*",
    "ab*bc",
    "ab*c",
    "ab+bc",
    "ab?bc",
    "ab?c",
    "abc",
    "abc$",
    "abcd*efg",
    "ab{,1}bc",
    "ab{,1}c",
    "ab{,3}bc",
    "ab{,}bc",
    "ab{\",5}bc",
    "ab{\"\",4}bc",
    "ab|cd",
    "a{,}{1,}c",
    "a|b|c|d|e",
    "multiple words of text",
    "multiple words",
    "w(?# comment 1)xy(?# comment 2)z",
    "w(?i)",
    "x\\B",
    "x\\b",
    "z\\B"
  ]

  test "parse" do
    for c <- @cases do
      IO.inspect(c)
      IO.inspect(Randex.Parser.parse(c))
    end
  end

  test "gen" do
    for c <- @cases do
      IO.inspect(c)

      regex = Regex.compile!(c)

      Randex.Parser.parse(c)
      |> IO.inspect()
      |> Randex.Generator.gen()
      |> Enum.take(10)
      |> Enum.each(fn sample ->
        assert sample =~ regex
      end)
    end
  end
end
