import xml.etree.ElementTree as ET
import json


def getElementName(namespace, name):
    return '{}{}'.format(namespace, name)


def getElementNameR(namespace, name):
    return '{}{}{}'.format('.//', namespace, name)


def getLocation(elem):
  lat, lng = None, None
  media_location = elem.find(getElementName(namespace_media, 'location'))
  if media_location is not None:
    georss_tag = getElementName(namespace_media, 'where')
    georss_where = media_location.find(georss_tag)
    if georss_where is not None:
      pos = georss_where.find(getElementName(namespace_media, 'Pos'))
      if pos is not None:
        pos = pos.text.split()
        lat = pos[0]
        lng = pos[1]
  return (lat, lng)


def getMediaContent(elem):
  new_content = {}
  media_content = getElementName(namespace_media, 'content')
  for child in elem:
    if child.tag == media_content:
      url = child.attrib['url']
      media_type = child.attrib['type']
      media_thumbnail = child.find(getElementName(namespace_media, 'thumbnail'))
      thumbnail = media_thumbnail.attrib['url']

      new_content['url'] = url
      new_content['media_type'] = media_type
      new_content['thumbnail'] = thumbnail
  return new_content


def getMedia(elem):
  media_array = []
  media_group = getElementName(namespace_media, 'group')

  for child in elem:
    if child.tag == media_group:
      media_array.append(getMediaContent(child))
  return media_array


tree = ET.parse('popular_memory.xml')
root = tree.getroot()
channel = root.find('channel')

namespace_gml = "{http://www.opengis.net/gml}"
namespace_media = "{http://search.yahoo.com/mrss}"
namespace_georss= "{http://www.georss.org/georss}"

data = {}
item_array = []

manual_lookup_latlng = [(1.301215, 103.883686),
                        (1.283905, 103.853649),
                        (1.422496, 103.828156),
                        (1.326521, 103.803812),
                        (1.282792, 103.851505),
                       ]
missing_count = 0;

for child in channel:
  if child.tag == 'item':
    new_item = {}
    link = child.find('link')
    description = child.find('description')
    pubDate = child.find('pubDate')
    author = child.find('Author')
    lat, lng = getLocation(child)
    media = getMedia(child)

    if lat is None:
      lat, lng = manual_lookup_latlng[missing_count]
      missing_count += 1

    new_item['link'] = link.text
    new_item['description'] = description.text
    new_item['pubDate'] = pubDate.text
    new_item['author'] = author.text
    new_item['lat'] = lat
    new_item['lng'] = lng
    new_item['media'] = media

    item_array.append(new_item)

data['result'] = item_array
json_data = json.dumps(data)
print json_data
