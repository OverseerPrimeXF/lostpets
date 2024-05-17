from xml.etree import ElementTree as et
datafile = './/test_sml.xml'
old_id = '05'
new_id = '07'
count = 2
tree = et.parse(datafile)
all_tooltips = tree.findall('Nodes/Node/ToolTip')
for tooltip in all_tooltips:
    # print(tooltip.text[0:2])
    tooltip.text = tooltip.text.replace(old_id, new_id, count)
    # tooltip.text = 
    print(tooltip.text)
    # print(tooltip.text)
tree.write(datafile)
