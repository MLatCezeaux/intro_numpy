import os
import jupy_pandoc_utils as jpu

notebook_list = [
    '../lecture/1-NumpyIntroduction.ipynb',
    '../lecture/2-GenericNumpyForHEP.ipynb',
    '../lecture/3-CollisionAnalysis.ipynb',
]

# Copy the notebooks
for nb in notebook_list:
    os.system('cp {} .'.format(nb))


# Convert into markdown
nb_to_be_concat = []
for nb in notebook_list:
    nb_name = nb.replace('../lecture/', '')
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
print('\nExecute this command:')
print('./makePDF.sh "title.yaml Preamble.md ' + ' '.join(nb_to_be_concat) + ' Conclusion.md" NumpyIntroduction_MLatLPC.pdf')

# os.system('./makePDF.sh "title.yaml Preamble.md ' + ' '.join(nb_to_be_concat) + '" NumpyIntroduction_MLatLPC.pdf')
# --> this doesn't produce the end of the PDF - I don't know why.

# Clean
os.system('rm -rf *.ipynb')
