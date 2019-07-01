execute block
(
  TEXT varchar(1000) = :TEXT
)
returns
(
  WORD_COUNT integer
)
as
declare variable i int;
declare variable Delimiters varchar(100);
declare variable Word_Start smallint;
begin
  Delimiters = '.,<>?!@#$%^&`~''"\/-_=+- ' ||
    ascii_char(13) || ascii_char(10) || ascii_char(9);

  WORD_COUNT = 0;
  Word_Start = 0;
  while (TEXT <> '') do
  begin
    if (position(left(TEXT, 1), Delimiters) = 0) then
      Word_Start = 1;
    else
    begin
      if (Word_Start = 1) then
        WORD_COUNT = WORD_COUNT + 1;
      Word_Start = 0;
    end
    TEXT = substring(TEXT from 2);
  end
  suspend;
end
