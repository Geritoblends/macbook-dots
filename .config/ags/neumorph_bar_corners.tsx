#!/usr/bin/env -S ags run

import app from "ags/gtk4/app"
import { Astal } from "ags/gtk4"

app.start({
    css: `
    window {
        background-color: transparent;
        color: transparent;
        margin-left: 0px;
    }

    .border {
        background-color: transparent;
        border-radius: 50px 0 0 50px;
        box-shadow: 
            0 0 0 0px #333333;
    }

    .deborder {
        background-color: transparent;
        border-radius: 50px 0 0 50px;
        box-shadow: 
            0 0px 0 12px alpha(#333333, 1);
        border-left: solid 6px #cccccc;
    }

    .antiborder {
        background-color: transparent;
        border-radius: 50px 0 0 50px;
        box-shadow: 
        0 0px 0 0px #333333;
    }

        `,
    main() {

        const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor

        return (
            <window visible anchor={ TOP | BOTTOM | LEFT }>
                    <box>
                        <overlay>
                            <box class="border">
                                hel
                            </box>

                            <box $type="overlay" class="deborder">
                            </box>

                            <box $type="overlay" class="antiborder">
                            </box>
                        </overlay>
                    </box>
            </window>
        )
    },
})
