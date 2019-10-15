package org.bamboo.ilovehub.serializer;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;

/**
 * Created by HomoEfficio on 2016-10-22.
 */
public class FamilyMemberSerializer extends JsonSerializer<FamilyMember> {

    @Override
    public void serialize(FamilyMember value, JsonGenerator gen, SerializerProvider serializers) throws IOException, JsonProcessingException {

        gen.writeStartObject();

        gen.writeFieldName("id");
        gen.writeString(String.valueOf(value.getId()));

        gen.writeFieldName("name");
        gen.writeString(value.getName());

        gen.writeFieldName("cellPhone2");
        gen.writeObject(value.getCellPhone());

        gen.writeFieldName("children");
        gen.writeObject(value.getChildren());

        gen.writeEndObject();
    }
}
