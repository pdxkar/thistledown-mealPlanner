package com.books.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.View;

public class ShellControllerTest {

private MockMvc mockMvc;
	
	@Mock
	View mockView;
		
	@Before
    public void setUp() throws Exception {
		mockMvc = MockMvcBuilders.standaloneSetup(new ShellController()).build();
		        MockitoAnnotations.initMocks(this);
		    }
	
	@Test
	public void testGetRootShell() throws Exception {		
		mockMvc.perform(get("/"))
        .andExpect(status().isOk())
        .andExpect(view().name("shell"));
	}
	
	@Test
	public void testGetPathedShell() throws Exception {		
		mockMvc.perform(get("/sometestURL/sometest/URI/sometest"))
        .andExpect(status().isOk())
        .andExpect(view().name("shell"));
	}

}
