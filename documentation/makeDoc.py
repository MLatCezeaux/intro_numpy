import os
import jupy_pandoc_utils as jpu

notebook_list = [
    '../section1/NumpyIntroduction.ipynb',
    '../section2/GenericNumpyForHEP.ipynb',
    '../section3/CollisionAnalysis.ipynb',
]

# Copy the notebooks
for nb in notebook_list:
    os.system('cp {} .'.format(nb))


# Convert into markdown
nb_to_be_concat = []
for nb in notebook_list:
    nb_name = nb.replace('../section1/', '').replace('../section2/', '').replace('../section3/', '')
    md_name = nb_name.replace('.ipynb', '.md')    
    jpu.nb2md(nb_name)

    # Dealing with 'png' as figure caption
    new_md = open('tmp.md', 'w')
    for l in open(md_name, 'r'):
        new_md.write(l.replace('![png]', '![]'))
    os.system('mv tmp.md {}'.format(md_name))

    # To be saved for later
    nb_to_be_concat.append(md_name)


# Make the full pdf
os.system('./makePDF.sh "title.md ' + ' '.join(nb_to_be_concat) + '" NumpyIntroduction_MLatLPC.pdf')


# Clean
os.system('rm -rf *.ipynb')
