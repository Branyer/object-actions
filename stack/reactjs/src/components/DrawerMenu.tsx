import React from 'react';
import {Box, Divider} from '@mui/material';
import ThemeSwitcher from "../theme/ThemeSwitcher";
import NavMenu from "./NavMenu";

const DrawerMenu = () => {

    return (
        <Box sx={{padding: 1}}>

            <NavMenu/>

            <Divider/>

            <ThemeSwitcher/>

        </Box>
    );
};

export default DrawerMenu;
