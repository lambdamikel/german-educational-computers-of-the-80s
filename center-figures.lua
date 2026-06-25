-- Center figure images and their italic caption lines (LaTeX/PDF output only).
-- The Markdown source is left untouched, so the GitHub README is unaffected.
-- A "caption" is an italic-only paragraph (*...*) immediately following an image.

function Pandoc(doc)
  if not FORMAT:match('latex') then
    return nil
  end
  local out = pandoc.List()
  local blocks = doc.blocks
  local i = 1
  while i <= #blocks do
    local b = blocks[i]
    local is_image = (b.t == 'Para' or b.t == 'Plain')
      and #b.content == 1 and b.content[1].t == 'Image'
    if is_image then
      -- small hand-drawn mascots: cap width so they aren't upscaled blurry
      local img = b.content[1]
      if img.src:match('computron') then
        img.attributes.width = '2.2in'
      end
      out:insert(pandoc.RawBlock('latex', '\\begin{center}'))
      out:insert(b)
      local nxt = blocks[i + 1]
      local is_caption = nxt and (nxt.t == 'Para' or nxt.t == 'Plain')
        and #nxt.content == 1 and nxt.content[1].t == 'Emph'
      if is_caption then
        out:insert(nxt)
        i = i + 1
      end
      out:insert(pandoc.RawBlock('latex', '\\end{center}'))
    else
      out:insert(b)
    end
    i = i + 1
  end
  doc.blocks = out
  return doc
end
