include "console.iol"
include "file.iol"
include "string_utils.iol"

main
{
  MENU = "../_old_docs/menu.json";
  SUMMARY = "../SUMMARY.md";
  ROOT = "documentation/";
  readFile@File( {.format = "json", .filename = MENU } )( menu );
  foreach ( topic -> menu.topics ) {
    toLowerCase@StringUtils( topic.label )( topic.address );
    replaceAll@StringUtils( topic.address { .regex = " ", .replacement = "_" } )( topic.address );
    summary += "* [" + topic.label + "](" + ROOT + topic.address + "/README.md)\n";
    foreach ( child -> topic.children ) {
      replaceAll@StringUtils( child.url { .regex = "\\.html", .replacement = ".md" } )( child.url );
      summary += "\t* [" + child.label + "](" + ROOT + child.url + ")\n"
    }
  };
  writeFile@File( { .content = summary, .filename = SUMMARY } )()
}