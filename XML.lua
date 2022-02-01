local function parseXmlTags(input)
	local tags = {}

	for tag, content in string.gmatch(input.content, "<([%w%d]-)>(.+)</%1>") do
		local moreContent = parseXmlTags({ tag = tag, content = content })
		if moreContent then
			content = moreContent
		end

		table.insert(tags, {
			tag = tag,
			content = content
		})
	end

	if #tags > 0 then
		return tags
	else
		return nil
	end
end

local function parseXml(input : string)
	local xml = {}

	local formatted = { tag = "content", content = input }
	local firstRun = parseXmlTags(formatted)

	return firstRun
end

return parseXml
