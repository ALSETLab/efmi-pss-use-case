// generated using template: cop_main.template---------------------------------------------
/******************************************************************************************
**
**  Module Name: cop_main.c
**  NOTE: Automatically generated file. DO NOT MODIFY!
**  Description:
**            Main file
**
******************************************************************************************/
// generated using template: arm/custom_include.template-----------------------------------


#ifdef __cplusplus
#include <limits>

extern "C" {
#endif

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>
#include <complex.h>
#include <time.h>
#include <stdarg.h>

// x86 libraries:
#include "../include/sp_functions_dev0.h"

#include "fmi2TypesPlatform.h"
#include "fmi2FunctionTypes.h"
#include "fmi2Functions.h"

#ifdef __cplusplus
}
#endif



#if defined(_WIN64)
#include <windows.h>
#else
#include <dlfcn.h>
#endif
// ----------------------------------------------------------------------------------------                // generated using template:generic_macros.template-----------------------------------------
/*********************** Macros (Inline Functions) Definitions ***************************/

// ----------------------------------------------------------------------------------------

#ifndef MAX
#define MAX(value, limit) (((value) > (limit)) ? (value) : (limit))
#endif
#ifndef MIN
#define MIN(value, limit) (((value) < (limit)) ? (value) : (limit))
#endif

// generated using template: VirtualHIL/custom_defines.template----------------------------

typedef unsigned char X_UnInt8;
typedef char X_Int8;
typedef signed short X_Int16;
typedef unsigned short X_UnInt16;
typedef int X_Int32;
typedef unsigned int X_UnInt32;
typedef unsigned int uint;
typedef double real;

// ----------------------------------------------------------------------------------------
// generated using template: custom_consts.template----------------------------------------

// arithmetic constants
#define C_SQRT_2                    1.4142135623730950488016887242097f
#define C_SQRT_3                    1.7320508075688772935274463415059f
#define C_PI                        3.1415926535897932384626433832795f
#define C_E                         2.7182818284590452353602874713527f
#define C_2PI                       6.283185307179586476925286766559f

//@cmp.def.start
//component defines

const unsigned int  _fmu_fmu__vr [ ] = {  2 ,  3  };
double  _fmu_fmu__tc;




//@cmp.def.end

//#define SP_SCOPE_FILE_DEBUG
#define SP_SCOPE_BUFF_SIZE (8388608*4)
#define SP_SCOPE_BUFF_SIZE_PER_ER (SP_SCOPE_BUFF_SIZE/4)

//-----------------------------------------------------------------------------------------
// generated using template: common_variables.template-------------------------------------
// true global variables




extern X_UnInt8* sp_scope_buffer_dev0;
extern FILE* f_sp_scope_debug;
uint64_t sp_scope_buff_addr_cpu0_er0_dev0;
uint64_t sp_scope_buff_start_addr_cpu0_er0_dev0;
uint32_t sp_scope_buff_index_cpu0_er0_dev0;

// const variables

//@cmp.var.start
// variables
double _step__out;
double _fmu_fmu__in;

double _fmu_fmu__out;
X_Int32 _fmu_fmu__out1;

float _status__in;
float _y__in;
//@cmp.var.end

//@cmp.svar.start
// state variables
double _step__state;



//@cmp.svar.end

//
// Tunable parameters
//
static struct Tunable_params {
} __attribute__((__packed__)) tunable_params;

void *tunable_params_dev0_cpu0_ptr = &tunable_params;

// Dll function pointers
#if defined(_WIN64)
static HINSTANCE SimplePI_ldll;
#else
// Define handles for loading dlls
static void * SimplePI_ldll;
#endif

// Define function pointers from DLL


static fmi2Component (*SimplePI_fmi2Instantiate) (fmi2String, fmi2Type, fmi2String, fmi2String, const fmi2CallbackFunctions*, fmi2Boolean, fmi2Boolean);
static void                 (*SimplePI_fmi2FreeInstance) (fmi2Component c);
static fmi2Status    (*SimplePI_fmi2SetupExperiment) (fmi2Component c, fmi2Boolean, fmi2Real, fmi2Real, fmi2Boolean, fmi2Real);
static fmi2Status    (*SimplePI_fmi2EnterInitializationMode) (fmi2Component);
static fmi2Status    (*SimplePI_fmi2ExitInitializationMode) (fmi2Component);
static fmi2Status    (*SimplePI_fmi2Terminate) (fmi2Component);
static fmi2Status    (*SimplePI_fmi2GetReal) (fmi2Component, const fmi2ValueReference [], size_t, fmi2Real []);
static fmi2Status    (*SimplePI_fmi2GetInteger) (fmi2Component, const fmi2ValueReference [], size_t, fmi2Integer []);
static fmi2Status    (*SimplePI_fmi2GetBoolean) (fmi2Component, const fmi2ValueReference [], size_t, fmi2Boolean []);
static fmi2Status    (*SimplePI_fmi2GetString) (fmi2Component, const fmi2ValueReference [], size_t, fmi2String []);
static fmi2Status    (*SimplePI_fmi2SetReal) (fmi2Component, const fmi2ValueReference [], size_t, const fmi2Real []);
static fmi2Status    (*SimplePI_fmi2SetInteger) (fmi2Component, const fmi2ValueReference [], size_t, const fmi2Integer []);
static fmi2Status    (*SimplePI_fmi2SetBoolean) (fmi2Component, const fmi2ValueReference [], size_t, const fmi2Boolean []);
static fmi2Status    (*SimplePI_fmi2SetString) (fmi2Component, const fmi2ValueReference [], size_t, const fmi2String []);
static fmi2Status    (*SimplePI_fmi2DoStep) (fmi2Component, fmi2Real, fmi2Real, fmi2Boolean);

fmi2Component _fmu = NULL;
fmi2Status _fmu_status;
int  isLoggingEnabled_fmu = 0;
static FILE *FMI_log_file_fmu = NULL;

static int isVirtualDevice = 1;

// generated using template: \templates\virtual_hil\fmi_custom_logger_fncs.template---------------------------------

static void get_status_string(fmi2Status status, char* status_string) {
    switch (status) {
    case fmi2OK:
        sprintf(status_string, "fmi2OK");
        break;
    case fmi2Warning:
        sprintf(status_string, "fmi2Warning");
        break;
    case fmi2Discard:
        sprintf(status_string, "fmi2Discard");
        break;
    case fmi2Error:
        sprintf(status_string, "fmi2Error");
        break;
    case fmi2Fatal:
        sprintf(status_string, "fmi2Fatal");
        break;
    case fmi2Pending:
        sprintf(status_string, "fmi2Pending");
        break;
    }
}

static void format_message(const char* formats, const char* message, va_list *args, char* formattedMessage) {
    char* possible_str;
    int possible_int[2];
    double possible_double[2];
    va_list args1;
    va_copy(args1, *args);
    if (strcmp(formats, "s") == 0) {
        possible_str = va_arg(args1, const char*);
        snprintf(formattedMessage, 256, message, possible_str);
    }
    else if (strcmp(formats, "df") == 0 || strcmp(formats, "dg") == 0) {
        possible_int[0] = va_arg(args1, int);
        possible_double[0] = va_arg(args1, double);
        snprintf(formattedMessage, 256, message, possible_int[0], possible_double[0]);
    }
    else if (strcmp(formats, "dd") == 0 || strcmp(formats, "du") == 0) {
        possible_int[0] = va_arg(args1, int);
        possible_int[1] = va_arg(args1, int);
        snprintf(formattedMessage, 256, message, possible_int[0], possible_int[1]);
    }
    else if (strcmp(formats, "ds") == 0) {
        possible_int[0] = va_arg(args1, int);
        possible_str = va_arg(args1, const char*);
        snprintf(formattedMessage, 256, message, possible_int[0], possible_str);
    }
    else if (strcmp(formats, "gg") == 0) {
        possible_double[0] = va_arg(args1, double);
        possible_double[1] = va_arg(args1, double);
        snprintf(formattedMessage, 256, message, possible_double[0], possible_double[1]);
    }
    else if (strcmp(formats, "g") == 0 || strcmp(formats, "f") == 0) {
        possible_double[0] = va_arg(args1, double);
        snprintf(formattedMessage, 256, message, possible_double[0]);
    }
    else if (strcmp(formats, "d") == 0 || strcmp(formats, "u") == 0) {
        possible_int[0] = va_arg(args1, int);
        snprintf(formattedMessage, 256, message, possible_int[0]);
    }
    else {
        snprintf(formattedMessage, 256, "This message format is not currently supported.\n %s", message);
    }
    va_end(args1);
}

static void parse_format(const char* message, char* formats) {
    const char *cursor = message;
    int idx = 0;
    while (*cursor != '\0') {
        if (*cursor == '%') {
            cursor++;
            // Skip optional flags
            if (*cursor == '-' || *cursor == '+' || *cursor == '#') cursor++;
            // Skip width
            if (*cursor >= '0' && *cursor <= '9') {
                cursor++;
                while (*cursor >= '0' && *cursor <= '9') cursor++;
            }
            // Skip precision
            if (*cursor == '.') {
                cursor++;
                while (*cursor >= '0' && *cursor <= '9') cursor++;
            }
            // Capture valid format specifiers
            if (*cursor == 'd' || *cursor == 'u' || *cursor == 's' || *cursor == 'f' || *cursor == 'g') {
                formats[idx++] = *cursor;
            }
            // Handle long modifiers
            if (*cursor == 'l') {
                cursor++;
                formats[idx++] = *cursor;
            }
        }
        cursor++;
    }
    formats[idx] = '\0';
}

static void fmi_logger_fnc2_dev0 (fmi2ComponentEnvironment componentEnvironment,
                                  fmi2String instanceName,
                                  fmi2Status status,
                                  fmi2String category,
                                  fmi2String message,
                                  ...) {
    char status_string[12] = "";
    char formattedMessage[256] = "";
    //Get all arguments
    va_list args;
    va_start(args, message);
    // Get status string
    get_status_string(status, status_string);
    //Parse format
    char formats[5] = "";
    parse_format(message, formats);
    if(strcmp(instanceName, "_fmu") == 0)
    {
        if(strlen(formats) == 0) {
            if (FMI_log_file_fmu != NULL)
                fprintf(FMI_log_file_fmu, "[INSTANCE: %s, STATUS: %s, CATEGORY: %s]: %s\n", instanceName, status_string, category, message);
        }
        else {
            //Format message
            format_message(formats, message, &args, formattedMessage);
            //Log result into file
            //Check if FMI_log_file != NULL before fprintf() call, because some FMU functions call logger although
            //loggingOn parameter is on false
            if (FMI_log_file_fmu != NULL)
                fprintf(FMI_log_file_fmu, "[INSTANCE: %s, STATUS: %s, CATEGORY: %s]: %s\n", instanceName, status_string, category, formattedMessage);
        }
    }
    va_end(args);
    return;
}

static fmi2CallbackFunctions callback_functions2 = {
    fmi_logger_fnc2_dev0,
    calloc,
    free,
    NULL,
    NULL
};


// generated using template: virtual_hil/custom_functions.template---------------------------------
void ReInit_user_sp_cpu0_dev0() {
#if DEBUG_MODE
    printf("\n\rReInitTimer");
#endif
    //@cmp.init.block.start
    _step__state = 0x0;
    {
        isLoggingEnabled_fmu = 1 ;
        char  *  resource_path_fmu = "file:///C:/Users/Luigi/Documents/TyphoonHIL/FMUimportTestSimplePiOMFMU Target files/ext-src/SimplePI/resources/";
        if ( isVirtualDevice == 0 && resource_path_fmu != NULL )     {
            resource_path_fmu = NULL ;
        }
        if ( _fmu == NULL )     {
            if ( isLoggingEnabled_fmu && isVirtualDevice )         {
                FMI_log_file_fmu = fopen ( "C:/Users/Luigi/Documents/TyphoonHIL/FMUimportTestSimplePiOMFMU Target files/_fmu.log" , "a" ) ;
            }
            _fmu = SimplePI_fmi2Instantiate ( "_fmu" , fmi2CoSimulation , "{4976243b-afc1-4e5f-b898-1ee0f43d8734}" , resource_path_fmu , & callback_functions2 , fmi2False , isLoggingEnabled_fmu ? fmi2True : fmi2False ) ;
        }
        else     {
            SimplePI_fmi2Terminate  ( _fmu );
            SimplePI_fmi2FreeInstance  ( _fmu );
            if ( FMI_log_file_fmu != NULL )         {
                fclose ( FMI_log_file_fmu ) ;
            }
            if ( isLoggingEnabled_fmu && isVirtualDevice )         {
                FMI_log_file_fmu = fopen ( "C:/Users/Luigi/Documents/TyphoonHIL/FMUimportTestSimplePiOMFMU Target files/_fmu.log" , "a" ) ;
            }
            _fmu = SimplePI_fmi2Instantiate ( "_fmu" , fmi2CoSimulation , "{4976243b-afc1-4e5f-b898-1ee0f43d8734}" , resource_path_fmu , & callback_functions2 , fmi2False , isLoggingEnabled_fmu ? fmi2True : fmi2False ) ;
        }
        SimplePI_fmi2SetupExperiment ( _fmu , fmi2False , 0.0 , 0.0 , fmi2False , 0.0 ) ;
        SimplePI_fmi2EnterInitializationMode  ( _fmu );
        SimplePI_fmi2ExitInitializationMode  ( _fmu );
        unsigned int  _fmu_tmp_vr;
        _fmu_fmu__tc = 0.0 ;
    }
    HIL_OutFloat(137101312, 0.0);
    HIL_OutAO(0x4000, 0.0f);
    sp_scope_buff_index_cpu0_er0_dev0 = 0;
    HIL_OutAO(0x4001, 0.0f);
    sp_scope_buff_index_cpu0_er0_dev0 = 0;
    //@cmp.init.block.end
}


// Dll function pointers and dll reload function
#if defined(_WIN64)
// Define method for reloading dll functions
void ReloadDllFunctions_user_sp_cpu0_dev0(void) {
    // Load each library and setup function pointers
}

void FreeDllFunctions_user_sp_cpu0_dev0(void) {
}

#else
// Define method for reloading dll functions
void ReloadDllFunctions_user_sp_cpu0_dev0(void) {
    // Load each library and setup function pointers
}

void FreeDllFunctions_user_sp_cpu0_dev0(void) {
}
#endif

void load_fmi_libraries_user_sp_cpu0_dev0(void) {
#if defined(_WIN64)
    HINSTANCE SimplePI_handle;
    /* C:/Users/Luigi/AppData/Roaming/typhoon/THCC 2025.3/apps/schematic_editor/code_generation/vhil/src_gen/ext-src/SimplePI/binaries/win64/SimplePI.dll */
    SimplePI_handle = LoadLibrary("C:/Users/Luigi/AppData/Roaming/typhoon/THCC 2025.3/apps/schematic_editor/code_generation/vhil/src_gen/ext-src/SimplePI/binaries/win64/SimplePI.dll");
    if (SimplePI_handle == NULL) {
        printf("FMI library not found.\n");
        exit(EXIT_FAILURE);
    }
    SimplePI_fmi2Instantiate = GetProcAddress(SimplePI_handle, "fmi2Instantiate");
    if (SimplePI_fmi2Instantiate == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2FreeInstance = GetProcAddress(SimplePI_handle, "fmi2FreeInstance");
    if (SimplePI_fmi2FreeInstance == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2SetupExperiment = GetProcAddress(SimplePI_handle, "fmi2SetupExperiment");
    if (SimplePI_fmi2SetupExperiment == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2EnterInitializationMode = GetProcAddress(SimplePI_handle, "fmi2EnterInitializationMode");
    if (SimplePI_fmi2EnterInitializationMode == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2ExitInitializationMode = GetProcAddress(SimplePI_handle, "fmi2ExitInitializationMode");
    if (SimplePI_fmi2ExitInitializationMode == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2Terminate = GetProcAddress(SimplePI_handle, "fmi2Terminate");
    if (SimplePI_fmi2Terminate == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2GetReal = GetProcAddress(SimplePI_handle, "fmi2GetReal");
    if (SimplePI_fmi2GetReal == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2GetInteger = GetProcAddress(SimplePI_handle, "fmi2GetInteger");
    if (SimplePI_fmi2GetInteger == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2GetBoolean = GetProcAddress(SimplePI_handle, "fmi2GetBoolean");
    if (SimplePI_fmi2GetBoolean == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2GetString = GetProcAddress(SimplePI_handle, "fmi2GetString");
    if (SimplePI_fmi2GetString == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2SetReal = GetProcAddress(SimplePI_handle, "fmi2SetReal");
    if (SimplePI_fmi2SetReal == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2SetInteger = GetProcAddress(SimplePI_handle, "fmi2SetInteger");
    if (SimplePI_fmi2SetInteger == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2SetBoolean = GetProcAddress(SimplePI_handle, "fmi2SetBoolean");
    if (SimplePI_fmi2SetBoolean == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2SetString = GetProcAddress(SimplePI_handle, "fmi2SetString");
    if (SimplePI_fmi2SetString == NULL) exit(EXIT_FAILURE);
    SimplePI_fmi2DoStep = GetProcAddress(SimplePI_handle, "fmi2DoStep");
    if (SimplePI_fmi2DoStep == NULL) exit(EXIT_FAILURE);
#else
    void *SimplePI_error;
    void *SimplePI_handle;
    SimplePI_handle = dlopen("C:/Users/Luigi/AppData/Roaming/typhoon/THCC 2025.3/apps/schematic_editor/code_generation/vhil/src_gen/ext-src/SimplePI/binaries/win64/SimplePI.dll", RTLD_LAZY);
    if (!SimplePI_handle) {
        printf("FMI library not found.\n");
        exit(EXIT_FAILURE);
    }
    dlerror();
    *(void **)(&SimplePI_fmi2Instantiate) = dlsym(SimplePI_handle, "fmi2Instantiate");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2FreeInstance) = dlsym(SimplePI_handle, "fmi2FreeInstance");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2SetupExperiment) = dlsym(SimplePI_handle, "fmi2SetupExperiment");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2EnterInitializationMode) = dlsym(SimplePI_handle, "fmi2EnterInitializationMode");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2ExitInitializationMode) = dlsym(SimplePI_handle, "fmi2ExitInitializationMode");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2Terminate) = dlsym(SimplePI_handle, "fmi2Terminate");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2GetReal) = dlsym(SimplePI_handle, "fmi2GetReal");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2GetInteger) = dlsym(SimplePI_handle, "fmi2GetInteger");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2GetBoolean) = dlsym(SimplePI_handle, "fmi2GetBoolean");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2GetString) = dlsym(SimplePI_handle, "fmi2GetString");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2SetReal) = dlsym(SimplePI_handle, "fmi2SetReal");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2SetInteger) = dlsym(SimplePI_handle, "fmi2SetInteger");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2SetBoolean) = dlsym(SimplePI_handle, "fmi2SetBoolean");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2SetString) = dlsym(SimplePI_handle, "fmi2SetString");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
    *(void **)(&SimplePI_fmi2DoStep) = dlsym(SimplePI_handle, "fmi2DoStep");
    if ((SimplePI_error = dlerror()) != NULL) exit(EXIT_FAILURE);
#endif
}


void ReInit_sp_scope_user_sp_cpu0_dev0() {
    // initialise SP Scope buffer pointer
    sp_scope_buff_index_cpu0_er0_dev0 = 0;
    sp_scope_buff_start_addr_cpu0_er0_dev0 = (uint64_t)sp_scope_buffer_dev0 + 0 * SP_SCOPE_BUFF_SIZE + 0 * SP_SCOPE_BUFF_SIZE_PER_ER;
}


// generated using template: virtual_hil/common_timer_counter_handler.template-------------------------

/*****************************************************************************************/
/**
* This function is the handler which performs processing for the timer counter.
* It is called from an interrupt context such that the amount of processing
* performed should be minimized.  It is called when the timer counter expires
* if interrupts are enabled.
*
*
* @param    None
*
* @return   None
*
* @note     None
*
*****************************************************************************************/

void TimerCounterHandler_0_user_sp_cpu0_dev0() {
#if DEBUG_MODE
    printf("\n\rTimerCounterHandler_0");
#endif
    //////////////////////////////////////////////////////////////////////////
    // Set tunable parameters
    //////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
    // Output block
    //////////////////////////////////////////////////////////////////////////
    //@cmp.out.block.start
    // Generated from the component: Step
    if (_step__state < 2.0) {
        _step__out = 0.0;
    } else {
        _step__out = 1.0;
    }
    // Generated from the component: FMU.FMU
    _fmu_fmu__in = _step__out;
    {
        if ( _fmu )     {
            SimplePI_fmi2SetReal ( _fmu , & _fmu_fmu__vr [ 0 ] , 1 , & _fmu_fmu__in ) ;
            _fmu_fmu__out1 = SimplePI_fmi2DoStep ( _fmu , _fmu_fmu__tc , 0.0001 , fmi2True ) ;
            SimplePI_fmi2GetReal ( _fmu , & _fmu_fmu__vr [ 1 ] , 1 , & _fmu_fmu__out ) ;
        }
    }
    // Generated from the component: Vsp1.Vs1
    HIL_OutFloat(137101312, (float) _fmu_fmu__out);
    // Generated from the component: status
    HIL_OutAO(0x4000, (float)_fmu_fmu__out1);
    _status__in = _fmu_fmu__out1;
    sp_scope_buff_addr_cpu0_er0_dev0 = sp_scope_buff_start_addr_cpu0_er0_dev0 + sp_scope_buff_index_cpu0_er0_dev0;
    //#ifdef SP_SCOPE_FILE_DEBUG
    //  fprintf(f_sp_scope_debug, "\nstart = %x, index = %x, addr = %x, value = %f.", sp_scope_buff_start_addr_cpu0_er0_dev0, sp_scope_buff_index_cpuuser_sp_cpu}_cpu0_er0_dev0, sp_scope_buff_addr_cpu0_er0_dev0, _status__in);
    //#endif
    memcpy((X_UnInt8 *)sp_scope_buff_addr_cpu0_er0_dev0, &_status__in, 4);
    //printf("\n\sp_scope_buff_addr_cpu0_er0_dev0, _status__in 0x%x\r\n", sp_scope_buff_addr_cpu0_er0_dev0);
    //printf("\n\r addr 0x%x, value 0x%x\r\n", sp_scope_buff_addr_cpu0_er0_dev0, *(X_UnInt32*)(sp_scope_buff_addr_cpu0_er0_dev0));
    //XIo_OutInt32(sp_scope_buff_addr_cpu0_er0_dev0, _status__in);
    sp_scope_buff_index_cpu0_er0_dev0 = (sp_scope_buff_index_cpu0_er0_dev0 + 4) % SP_SCOPE_BUFF_SIZE_PER_ER;
    // Generated from the component: y
    HIL_OutAO(0x4001, (float)_fmu_fmu__out);
    _y__in = _fmu_fmu__out;
    sp_scope_buff_addr_cpu0_er0_dev0 = sp_scope_buff_start_addr_cpu0_er0_dev0 + sp_scope_buff_index_cpu0_er0_dev0;
    //#ifdef SP_SCOPE_FILE_DEBUG
    //  fprintf(f_sp_scope_debug, "\nstart = %x, index = %x, addr = %x, value = %f.", sp_scope_buff_start_addr_cpu0_er0_dev0, sp_scope_buff_index_cpuuser_sp_cpu}_cpu0_er0_dev0, sp_scope_buff_addr_cpu0_er0_dev0, _y__in);
    //#endif
    memcpy((X_UnInt8 *)sp_scope_buff_addr_cpu0_er0_dev0, &_y__in, 4);
    //printf("\n\sp_scope_buff_addr_cpu0_er0_dev0, _y__in 0x%x\r\n", sp_scope_buff_addr_cpu0_er0_dev0);
    //printf("\n\r addr 0x%x, value 0x%x\r\n", sp_scope_buff_addr_cpu0_er0_dev0, *(X_UnInt32*)(sp_scope_buff_addr_cpu0_er0_dev0));
    //XIo_OutInt32(sp_scope_buff_addr_cpu0_er0_dev0, _y__in);
    sp_scope_buff_index_cpu0_er0_dev0 = (sp_scope_buff_index_cpu0_er0_dev0 + 4) % SP_SCOPE_BUFF_SIZE_PER_ER;
//@cmp.out.block.end
    //////////////////////////////////////////////////////////////////////////
    // Update block
    //////////////////////////////////////////////////////////////////////////
    //@cmp.update.block.start
    // Generated from the component: Step
    if (_step__state <= 2.0)
        _step__state += 0.0001;
    // Generated from the component: FMU.FMU
    {
        _fmu_fmu__tc += 0.0001 ;
    }
    //@cmp.update.block.end
}
// ----------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------