import { Controller } from "@hotwired/stimulus";
import EditorJS from '@editorjs/editorjs';
import delimiter from '@editorjs/delimiter';
import list from '@editorjs/list';
import paragraph from '@editorjs/paragraph';
import header from '@editorjs/header';
import embed from '@editorjs/embed';
import image from '@editorjs/image';
import link from '@editorjs/link';
import marker from '@editorjs/marker';
import raw from '@editorjs/raw';
import warning from '@editorjs/warning';
import table from '@editorjs/table';
import Alert from 'editorjs-alert';
import AlignmentTuneTool from 'editorjs-text-alignment-blocktune';
// Connects to data-controller="rich-text"
export default class extends Controller {
  connect() {
    const selector = $('input[name="page[content]"]').length > 0 ? 'page' : 'home_section';
    const content = $(`input[name="${selector}[content]"]`).val();
      console.log({content});
      const data = typeof content === 'string' && content !== '' ? JSON.parse(content) : {};

      const editor = new EditorJS({
        tools: {
          paragraph: {
            class: paragraph,
            inlineToolbar: true,
            tunes: ['alignmentTune'],
          },
          alignmentTune: {
            class: AlignmentTuneTool,
            config:{
              default: "left",
              blocks: {
                header: 'center',
                list: 'right'
              }
            },
          },
          delimiter,
          list: {
            class: list,
            inlineToolbar: true,
          },
          linkTool: {
            class: link,
            config: {
              endpoint: '/editor/link', // Your backend endpoint for url data fetching,
            }
          },
          header: {
            class: header,
            inlineToolbar : true,
            tunes: ['alignmentTune'],
          },
          image,
          embed: {
            class: embed,
            config: {
              services: {
                youtube: true,
              }
            }
          },
          image: {
            class: image,
            inlineToolbar: true,
            config: {
              endpoints: {
                byFile: '/editor/image',
                byUrl: '/editor/image',
              }
            }
          },
          marker,
          raw,
          // warning,
          table: {
            class: table,
            inlineToolbar: true
          },
          alert: {
            class: Alert,
            inlineToolbar: true,
            config: {
              defaultType: 'primary',
              messagePlaceholder: 'Enter something',
            },
          },
        },
        data,
        onChange: (api, event) => {
          $('[type="submit"]').prop('disabled', true);
          editor.save().then((outputData) => {
            $(`input[name="${selector}[content]"]`).val(JSON.stringify(outputData));
            $('[type="submit"]').prop('disabled', false);
          }).catch((error) => {
            console.log('Saving failed: ', error)
          });
        }
      });
  }
}
