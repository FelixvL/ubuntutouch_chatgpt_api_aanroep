'''
 Copyright (C) 2025  fts

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; version 3.

 chatgptapitrial is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
'''

def speak(text):
    print("----------------",text)
    return ai_aanroepen("Wat is frankrijk" , "abc")

def ai_aanroepen(invoer_op_scherm, api_key_p):
    import os
    import openai


    from openai import OpenAI
    client = OpenAI(api_key="geheim")
    invoer = invoer_op_scherm
    completion = client.chat.completions.create(
      model="gpt-3.5-turbo",
      messages=[{
          "role": "system",
          "content": invoer
        }],
        temperature=0.5,
        max_tokens=1024
    )

    return completion.choices[0].message.content
