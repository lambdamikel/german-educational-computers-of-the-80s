-- Make relative links absolute (LaTeX/PDF output only). In the README they
-- point to files in this repository and work on GitHub; in a PDF, LaTeX
-- would turn them into links to local PDF files ("translations/.pdf").
local REPO = 'https://github.com/lambdamikel/german-educational-computers-of-the-80s/'

function Link(el)
  if not FORMAT:match('latex') then
    return nil
  end
  local t = el.target
  if t:match('^%a[%w+.-]*:') or t:match('^#') then
    return nil
  end
  if t:match('/$') then
    el.target = REPO .. 'tree/main/' .. t
  else
    el.target = REPO .. 'blob/main/' .. t
  end
  return el
end
