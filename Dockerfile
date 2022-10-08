#
# Run fasta file through muscle3 and return the results
# relies on input fasta via volume at /input/in.fasta
# 
# Building: docker build -t muscle3:latest .
# Running:  docker run --rm -v /home/mwp/data/Ent.fasta:/input/in.fasta -it muscle3:latest
FROM gcc:latest

# make app dir and copy source
RUN mkdir /app
COPY src /app/src
WORKDIR /app/src

# build muscle3 and hide the tty errors
RUN make 2> /dev/null

# make input and output dirs
RUN mkdir /input
RUN mkdir /output

# copy run script that cats output
COPY run.sh /app/src/run.sh
ENTRYPOINT [ "/app/src/run.sh" ]
