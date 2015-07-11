import xml.etree.ElementTree as ET
tree = ET.parse('popular_memory.xml')
root = tree.getroot()
channel = root.find('channel')

for child in channel:
  if child.tag == 'item':
    link = child.find('link')
    description = child.find('description')
    pubDate = child.find('pubDate')
    author = child.find('Author')
    print link.text
    print description.text
    print pubDate.text
    print author.text

