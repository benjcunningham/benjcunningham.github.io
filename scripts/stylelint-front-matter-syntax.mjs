// Stylelint custom syntax: postcss-scss, but with Jekyll front matter blanked
// out so it parses. Newlines are kept so reported line numbers still match.
// (Stylelint 16+ processors can no longer rewrite source, which broke
// stylelint-processor-ignore-front-matter.)
import postcssScss from "postcss-scss";

const FRONT_MATTER = /^---\r?\n(?:[\s\S]*?\r?\n)?---(?=\r?\n|$)/;

const blank = (css) =>
  css.replace(FRONT_MATTER, (match) => match.replace(/[^\r\n]/g, ""));

export default {
  parse: (css, opts) => postcssScss.parse(blank(css.toString()), opts),
  stringify: postcssScss.stringify,
};
