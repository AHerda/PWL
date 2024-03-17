FROM swipl

WORKDIR /PWL

COPY . .

RUN swipl
