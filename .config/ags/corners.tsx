const { options } = await Service.import("options")
const { corners, transparent } = options.bar

app.start({
    main(monitor = 0) {
        const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor
        
        return (
            <window
                name={`corner${monitor}`}
                class_name="screen-corner"
                visible={true}
                click_through={true}
                anchor={TOP | BOTTOM | RIGHT | LEFT}
                monitor={monitor}
                $={(self) => {
                    self.hook(corners, () => {
                        self.toggleClassName("corners", corners.value > 0)
                    })
                    self.hook(transparent, () => {
                        self.toggleClassName("hidden", transparent.value)
                    })
                }}
            >
                <box class_name="shadow">
                    <box class_name="border" expand={true}>
                        <box class_name="corner" expand={true} />
                    </box>
                </box>
            </window>
        )
    }
})
