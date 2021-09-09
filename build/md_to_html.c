// Created by Idel Martinez and Jerrett Longworth.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LINE_NUMBER "lineNumber"

void converter(char *filename)
{
  char buffer[512];

  // Convert markdown to HTML
  system("pandoc tmp.md -o tmp.html --highlight-style tango --self-contained -V title:' ' --metadata title=' '");

  // Convert markdown to docx
  sprintf(buffer, "pandoc tmp.md -o %s.docx --highlight-style tango", filename);
  system(buffer);

  // Convert markdown to pdf
  sprintf(buffer, "pandoc tmp.md -o %s.pdf --highlight-style tango", filename);
  system(buffer);

  // Fix CSS
  sprintf(buffer, "python3 -m premailer -f tmp.html -o %s.html", filename);
  system(buffer);
}

void addLineNumbers(FILE *file, FILE *tempFile)
{
  char *line = NULL;
  int addNum = 0, tabbed = 0, lineNum = 1;
  size_t len = 0;

  while (getline(&line, &len, file) != EOF)
  {
    if (strstr(line, "```") != NULL)
    {
      if (line[0] == '\t' || line[0] == ' ')
        tabbed = 1;
      if (strstr(line, LINE_NUMBER) != NULL)
      {
        lineNum = addNum = 1;
        line[strlen(line) - 12] = '\n';
        line[strlen(line) - 11] = '\0';
        fputs(line, tempFile);
        continue;
      }
      addNum = tabbed = 0;
    }

    if (addNum)
    {
      if (tabbed)
        fprintf(tempFile, "\t%d", lineNum++);
      else
        fprintf(tempFile, "%d\t", lineNum++);
    }

    fputs(line, tempFile);
  }

  free(line);
}

int main(int argc, char **argv)
{
  FILE *file, *tempFile;

  if (argc < 2)
  {
    printf("Error: Expected '%s <nameOfFile>'\n", argv[0]);
    return -1;
  }

  if ((file = fopen(argv[1], "r+")) == NULL || (tempFile = fopen("tmp.md", "w+")) == NULL)
  {
    printf("Error opening file.\n");
    return -1;
  }

  addLineNumbers(file, tempFile);
  fclose(file);
  fclose(tempFile);

  char *filenameNoExtension = strtok(argv[1], ".");

  converter(filenameNoExtension);
  system("rm tmp.*");

  return 0;
}
