Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA0A2630F43
	for <lists+linux-fbdev@lfdr.de>; Sat, 19 Nov 2022 16:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbiKSPZm (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 19 Nov 2022 10:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbiKSPZl (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 19 Nov 2022 10:25:41 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1CF37FC1C
        for <linux-fbdev@vger.kernel.org>; Sat, 19 Nov 2022 07:25:38 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 8AB8D21A8F;
        Sat, 19 Nov 2022 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1668871537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1WznK9wpf7Wz12PB6ryxi3Hhn9wDJFV/+9CE/U+xjIY=;
        b=p6NCQhvPm9hP/zRamc/vfZzzOPo7qCm+btXG4aWZX38NJ70FAOo/oCp9PpYvPm32o5xTPN
        qzI3uESbZIoXzSO8F6SEIpwmo7jVhlKXNi3RsWFowbPkOR53cXfrb02J5pKISwy7KzTHlJ
        4DL6b2qELq0m8OYc58xs2lCdpVEMdlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1668871537;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1WznK9wpf7Wz12PB6ryxi3Hhn9wDJFV/+9CE/U+xjIY=;
        b=GKG3SjBWK/dxedT1LDD+7Z1Nbq40agXoGHhuszxP5Wy4jv/UbaIVsjhF5cn3VSCHNzlowx
        xIE/vlbJ8bn3UfDA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id C4EDE2C141;
        Sat, 19 Nov 2022 15:25:36 +0000 (UTC)
Date:   Sat, 19 Nov 2022 16:25:35 +0100
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
        deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
        benh@kernel.crashing.org, paulus@samba.org, geert@linux-m68k.org,
        mark.cave-ayland@ilande.co.uk, linux-fbdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 1/5] drm/ofdrm: Add ofdrm for Open Firmware
 framebuffers
Message-ID: <20221119152535.GW28810@kitsune.suse.cz>
References: <20221011150712.3928-1-tzimmermann@suse.de>
 <20221011150712.3928-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011150712.3928-2-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello,

On Tue, Oct 11, 2022 at 05:07:08PM +0200, Thomas Zimmermann wrote:
> Open Firmware provides basic display output via the 'display' node.
> DT platform code already provides a device that represents the node's
> framebuffer. Add a DRM driver for the device. The display mode and
> color format is pre-initialized by the system's firmware. Runtime
> modesetting via DRM is not possible. The display is useful during
> early boot stages or as error fallback.
> 
> Similar functionality is already provided by fbdev's offb driver,
> which is insufficient for modern userspace. The old driver includes
> support for BootX device tree, which can be found on old 32-bit
> PowerPC Macintosh systems. If these are still in use, the
> functionality can be added to ofdrm or implemented in a new
> driver. As with simpledrm, the fbdev driver cannot be selected if
> ofdrm is already enabled.
> 
> Two notable points about the driver:
> 
>  * Reading the framebuffer aperture from the device tree is not
> reliable on all systems. Ofdrm takes the heuristics and a comment
> from offb to pick the correct range.
> 
>  * No resource management may be tied to the underlying PCI device.
> Otherwise the handover to the native driver will fail with a resource
> conflict. PCI management is therefore done as part of the platform
> device's cleanup.
> 
> The driver has been tested on qemu's ppc64le emulation. The device
> hand-over has been tested with bochs.
> 
> v5:
> 	* use drm_atomic_helper_check_crtc_primary_plane()
> v4:
> 	* set preferred depth to the correct value
> 	* set bpp value for console emulation
> 	* output scanout-buffer parameters with drm_dbg()
> v3:
> 	* reintegrate FWFB helpers into ofdrm
> 	* use damage iterator
> 	* sync GEM BOs with drm_gem_fb_{begin,end}_cpu_access()
> 	* fix various atomic_check helpers
> 	* remove CRTC atomic_{enable,disable} (Javier)
> 	* compute stride with drm_format_info_min_pitch() (Daniel)
> v2:
> 	* removed simple-pipe helpers
> 	* built driver on top of FWFB helpers
> 	* merged all init code into single function
> 	* make PCI support optional (Michal)
> 	* support COMPILE_TEST (Javier)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> convert
> ---
>  MAINTAINERS                   |   1 +
>  drivers/gpu/drm/tiny/Kconfig  |  13 +
>  drivers/gpu/drm/tiny/Makefile |   1 +
>  drivers/gpu/drm/tiny/ofdrm.c  | 763 ++++++++++++++++++++++++++++++++++
>  drivers/video/fbdev/Kconfig   |   1 +
>  5 files changed, 779 insertions(+)
>  create mode 100644 drivers/gpu/drm/tiny/ofdrm.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f07a8bf8744f..7c3bb04bd08e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6656,6 +6656,7 @@ L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/drm_aperture.c
> +F:	drivers/gpu/drm/tiny/ofdrm.c
>  F:	drivers/gpu/drm/tiny/simpledrm.c
>  F:	drivers/video/aperture.c
>  F:	include/drm/drm_aperture.h
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 565957264875..a300b03a3c7a 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -51,6 +51,19 @@ config DRM_GM12U320
>  	 This is a KMS driver for projectors which use the GM12U320 chipset
>  	 for video transfer over USB2/3, such as the Acer C120 mini projector.
>  
> +config DRM_OFDRM
> +	tristate "Open Firmware display driver"
> +	depends on DRM && OF && (PPC || COMPILE_TEST)
> +	select APERTURE_HELPERS
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KMS_HELPER
> +	help
> +	  DRM driver for Open Firmware framebuffers.
> +
> +	  This driver assumes that the display hardware has been initialized
> +	  by the Open Firmware before the kernel boots. Scanout buffer, size,
> +	  and display format must be provided via device tree.
> +
>  config DRM_PANEL_MIPI_DBI
>  	tristate "DRM support for MIPI DBI compatible panels"
>  	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 1d9d6227e7ab..76dde89a044b 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
>  obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
>  obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
>  obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
> +obj-$(CONFIG_DRM_OFDRM)			+= ofdrm.o
>  obj-$(CONFIG_DRM_PANEL_MIPI_DBI)	+= panel-mipi-dbi.o
>  obj-$(CONFIG_DRM_SIMPLEDRM)		+= simpledrm.o
>  obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> new file mode 100644
> index 000000000000..96a46078ade8
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -0,0 +1,763 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/of_address.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_aperture.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#define DRIVER_NAME	"ofdrm"
> +#define DRIVER_DESC	"DRM driver for OF platform devices"
> +#define DRIVER_DATE	"20220501"
> +#define DRIVER_MAJOR	1
> +#define DRIVER_MINOR	0
> +
> +/*
> + * Helpers for display nodes
> + */
> +
> +static int display_get_validated_int(struct drm_device *dev, const char *name, uint32_t value)
> +{
> +	if (value > INT_MAX) {
> +		drm_err(dev, "invalid framebuffer %s of %u\n", name, value);
> +		return -EINVAL;
> +	}
> +	return (int)value;
> +}
> +
> +static int display_get_validated_int0(struct drm_device *dev, const char *name, uint32_t value)
> +{
> +	if (!value) {
> +		drm_err(dev, "invalid framebuffer %s of %u\n", name, value);
> +		return -EINVAL;
> +	}
> +	return display_get_validated_int(dev, name, value);
> +}
> +
> +static const struct drm_format_info *display_get_validated_format(struct drm_device *dev,
> +								  u32 depth)
> +{
> +	const struct drm_format_info *info;
> +	u32 format;
> +
> +	switch (depth) {
> +	case 8:
> +		format = drm_mode_legacy_fb_format(8, 8);
> +		break;
> +	case 15:
> +	case 16:
> +		format = drm_mode_legacy_fb_format(16, depth);
> +		break;
> +	case 32:
> +		format = drm_mode_legacy_fb_format(32, 24);
> +		break;
> +	default:
> +		drm_err(dev, "unsupported framebuffer depth %u\n", depth);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	info = drm_format_info(format);
> +	if (!info) {
> +		drm_err(dev, "cannot find framebuffer format for depth %u\n", depth);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return info;
> +}
> +
> +static int display_read_u32_of(struct drm_device *dev, struct device_node *of_node,
> +			       const char *name, u32 *value)
> +{
> +	int ret = of_property_read_u32(of_node, name, value);
> +
> +	if (ret)
> +		drm_err(dev, "cannot parse framebuffer %s: error %d\n", name, ret);
> +	return ret;
> +}
> +
> +static int display_get_width_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	u32 width;
> +	int ret = display_read_u32_of(dev, of_node, "width", &width);
> +
> +	if (ret)
> +		return ret;
> +	return display_get_validated_int0(dev, "width", width);
> +}
> +
> +static int display_get_height_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	u32 height;
> +	int ret = display_read_u32_of(dev, of_node, "height", &height);
> +
> +	if (ret)
> +		return ret;
> +	return display_get_validated_int0(dev, "height", height);
> +}
> +
> +static int display_get_depth_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	u32 depth;
> +	int ret = display_read_u32_of(dev, of_node, "depth", &depth);
> +
> +	if (ret)
> +		return ret;
> +	return display_get_validated_int0(dev, "depth", depth);
> +}
> +
> +static int display_get_linebytes_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	u32 linebytes;
> +	int ret = display_read_u32_of(dev, of_node, "linebytes", &linebytes);
> +
> +	if (ret)
> +		return ret;
> +	return display_get_validated_int(dev, "linebytes", linebytes);
> +}
> +
> +static u64 display_get_address_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	u32 address;
> +	int ret;
> +
> +	/*
> +	 * Not all devices provide an address property, it's not
> +	 * a bug if this fails. The driver will try to find the
> +	 * framebuffer base address from the device's memory regions.
> +	 */
> +	ret = of_property_read_u32(of_node, "address", &address);
> +	if (ret)
> +		return OF_BAD_ADDR;
> +
> +	return address;
> +}
> +
> +/*
> + * Open Firmware display device
> + */
> +
> +struct ofdrm_device {
> +	struct drm_device dev;
> +	struct platform_device *pdev;
> +
> +	/* firmware-buffer settings */
> +	struct iosys_map screen_base;
> +	struct drm_display_mode mode;
> +	const struct drm_format_info *format;
> +	unsigned int pitch;
> +
> +	/* modesetting */
> +	uint32_t formats[8];
> +	struct drm_plane primary_plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +};
> +
> +static struct ofdrm_device *ofdrm_device_of_dev(struct drm_device *dev)
> +{
> +	return container_of(dev, struct ofdrm_device, dev);
> +}
> +
> +/*
> + * Hardware
> + */
> +
> +#if defined(CONFIG_PCI)
> +static struct pci_dev *display_get_pci_dev_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	const __be32 *vendor_p, *device_p;
> +	u32 vendor, device;
> +	struct pci_dev *pcidev;
> +
> +	vendor_p = of_get_property(of_node, "vendor-id", NULL);
> +	if (!vendor_p)
> +		return ERR_PTR(-ENODEV);
> +	vendor = be32_to_cpup(vendor_p);
> +
> +	device_p = of_get_property(of_node, "device-id", NULL);
> +	if (!device_p)
> +		return ERR_PTR(-ENODEV);
> +	device = be32_to_cpup(device_p);
> +
> +	pcidev = pci_get_device(vendor, device, NULL);
> +	if (!pcidev)
> +		return ERR_PTR(-ENODEV);
> +
> +	return pcidev;
> +}
> +
> +static void ofdrm_pci_release(void *data)
> +{
> +	struct pci_dev *pcidev = data;
> +
> +	pci_disable_device(pcidev);
> +}
> +
> +static int ofdrm_device_init_pci(struct ofdrm_device *odev)
> +{
> +	struct drm_device *dev = &odev->dev;
> +	struct platform_device *pdev = to_platform_device(dev->dev);
> +	struct device_node *of_node = pdev->dev.of_node;
> +	struct pci_dev *pcidev;
> +	int ret;
> +
> +	/*
> +	 * Never use pcim_ or other managed helpers on the returned PCI
> +	 * device. Otherwise, probing the native driver will fail for
> +	 * resource conflicts. PCI-device management has to be tied to
> +	 * the lifetime of the platform device until the native driver
> +	 * takes over.
> +	 */
> +	pcidev = display_get_pci_dev_of(dev, of_node);
> +	if (IS_ERR(pcidev))
> +		return 0; /* no PCI device found; ignore the error */
> +
> +	ret = pci_enable_device(pcidev);
> +	if (ret) {
> +		drm_err(dev, "pci_enable_device(%s) failed: %d\n",
> +			dev_name(&pcidev->dev), ret);
> +		return ret;
> +	}
> +	ret = devm_add_action_or_reset(&pdev->dev, ofdrm_pci_release, pcidev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +#else
> +static int ofdrm_device_init_pci(struct ofdrm_device *odev)
> +{
> +	return 0;
> +}
> +#endif
> +
> +/*
> + *  OF display settings
> + */
> +
> +static struct resource *ofdrm_find_fb_resource(struct ofdrm_device *odev,
> +					       struct resource *fb_res)
> +{
> +	struct platform_device *pdev = to_platform_device(odev->dev.dev);
> +	struct resource *res, *max_res = NULL;
> +	u32 i;
> +
> +	for (i = 0; pdev->num_resources; ++i) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> +		if (!res)
> +			break; /* all resources processed */
> +		if (resource_size(res) < resource_size(fb_res))
> +			continue; /* resource too small */
> +		if (fb_res->start && resource_contains(res, fb_res))
> +			return res; /* resource contains framebuffer */
> +		if (!max_res || resource_size(res) > resource_size(max_res))
> +			max_res = res; /* store largest resource as fallback */
> +	}
> +
> +	return max_res;
> +}
> +
> +/*
> + * Modesetting
> + */
> +
> +/*
> + * Support all formats of OF display and maybe more; in order
> + * of preference. The display's update function will do any
> + * conversion necessary.
> + *
> + * TODO: Add blit helpers for remaining formats and uncomment
> + *       constants.
> + */
> +static const uint32_t ofdrm_primary_plane_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_RGB565,
> +	//DRM_FORMAT_XRGB1555,
> +	//DRM_FORMAT_C8,
> +};
> +
> +static const uint64_t ofdrm_primary_plane_format_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
> +						   struct drm_atomic_state *new_state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
> +	struct drm_crtc *new_crtc = new_plane_state->crtc;
> +	struct drm_crtc_state *new_crtc_state = NULL;
> +
> +	if (new_crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
> +
> +	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						   DRM_PLANE_NO_SCALING,
> +						   DRM_PLANE_NO_SCALING,
> +						   false, false);
> +}
> +
> +static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
> +						     struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct ofdrm_device *odev = ofdrm_device_of_dev(dev);
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	unsigned int dst_pitch = odev->pitch;
> +	const struct drm_format_info *dst_format = odev->format;
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_rect damage;
> +	int ret, idx;
> +
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret)
> +		return;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		goto out_drm_gem_fb_end_cpu_access;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		struct iosys_map dst = odev->screen_base;
> +		struct drm_rect dst_clip = plane_state->dst;
> +
> +		if (!drm_rect_intersect(&dst_clip, &damage))
> +			continue;
> +
> +		iosys_map_incr(&dst, drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip));
> +		drm_fb_blit(&dst, &dst_pitch, dst_format->format, shadow_plane_state->data, fb,
> +			    &damage);
> +	}
> +
> +	drm_dev_exit(idx);
> +out_drm_gem_fb_end_cpu_access:
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +}
> +
> +static void ofdrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
> +						      struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct ofdrm_device *odev = ofdrm_device_of_dev(dev);
> +	struct iosys_map dst = odev->screen_base;
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	void __iomem *dst_vmap = dst.vaddr_iomem; /* TODO: Use mapping abstraction */
> +	unsigned int dst_pitch = odev->pitch;
> +	const struct drm_format_info *dst_format = odev->format;
> +	struct drm_rect dst_clip;
> +	unsigned long lines, linepixels, i;
> +	int idx;
> +
> +	drm_rect_init(&dst_clip,
> +		      plane_state->src_x >> 16, plane_state->src_y >> 16,
> +		      plane_state->src_w >> 16, plane_state->src_h >> 16);
> +
> +	lines = drm_rect_height(&dst_clip);
> +	linepixels = drm_rect_width(&dst_clip);
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		return;
> +
> +	/* Clear buffer to black if disabled */
> +	dst_vmap += drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip);
> +	for (i = 0; i < lines; ++i) {
> +		memset_io(dst_vmap, 0, linepixels * dst_format->cpp[0]);
> +		dst_vmap += dst_pitch;
> +	}
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static const struct drm_plane_helper_funcs ofdrm_primary_plane_helper_funcs = {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check = ofdrm_primary_plane_helper_atomic_check,
> +	.atomic_update = ofdrm_primary_plane_helper_atomic_update,
> +	.atomic_disable = ofdrm_primary_plane_helper_atomic_disable,
> +};
> +
> +static const struct drm_plane_funcs ofdrm_primary_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
> +};
> +
> +static enum drm_mode_status ofdrm_crtc_helper_mode_valid(struct drm_crtc *crtc,
> +							 const struct drm_display_mode *mode)
> +{
> +	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->dev);
> +
> +	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &odev->mode);
> +}
> +
> +static int ofdrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
> +					  struct drm_atomic_state *new_state)
> +{
> +	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
> +
> +	if (!new_crtc_state->enable)
> +		return 0;
> +
> +	return drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
> +}
> +
> +/*
> + * The CRTC is always enabled. Screen updates are performed by
> + * the primary plane's atomic_update function. Disabling clears
> + * the screen in the primary plane's atomic_disable function.
> + */
> +static const struct drm_crtc_helper_funcs ofdrm_crtc_helper_funcs = {
> +	.mode_valid = ofdrm_crtc_helper_mode_valid,
> +	.atomic_check = ofdrm_crtc_helper_atomic_check,
> +};
> +
> +static const struct drm_crtc_funcs ofdrm_crtc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static int ofdrm_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	struct ofdrm_device *odev = ofdrm_device_of_dev(connector->dev);
> +
> +	return drm_connector_helper_get_modes_fixed(connector, &odev->mode);
> +}
> +
> +static const struct drm_connector_helper_funcs ofdrm_connector_helper_funcs = {
> +	.get_modes = ofdrm_connector_helper_get_modes,
> +};
> +
> +static const struct drm_connector_funcs ofdrm_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static const struct drm_mode_config_funcs ofdrm_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +/*
> + * Init / Cleanup
> + */
> +
> +static struct drm_display_mode ofdrm_mode(unsigned int width, unsigned int height)
> +{
> +	/*
> +	 * Assume a monitor resolution of 96 dpi to
> +	 * get a somewhat reasonable screen size.
> +	 */
> +	const struct drm_display_mode mode = {
> +		DRM_MODE_INIT(60, width, height,
> +			      DRM_MODE_RES_MM(width, 96ul),
> +			      DRM_MODE_RES_MM(height, 96ul))
> +	};
> +
> +	return mode;
> +}
> +
> +static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
> +						struct platform_device *pdev)
> +{
> +	struct device_node *of_node = pdev->dev.of_node;
> +	struct ofdrm_device *odev;
> +	struct drm_device *dev;
> +	int width, height, depth, linebytes;
> +	const struct drm_format_info *format;
> +	u64 address;
> +	resource_size_t fb_size, fb_base, fb_pgbase, fb_pgsize;
> +	struct resource *res, *mem;
> +	void __iomem *screen_base;
> +	struct drm_plane *primary_plane;
> +	struct drm_crtc *crtc;
> +	struct drm_encoder *encoder;
> +	struct drm_connector *connector;
> +	unsigned long max_width, max_height;
> +	size_t nformats;
> +	int ret;
> +
> +	odev = devm_drm_dev_alloc(&pdev->dev, drv, struct ofdrm_device, dev);
> +	if (IS_ERR(odev))
> +		return ERR_CAST(odev);
> +	dev = &odev->dev;
> +	platform_set_drvdata(pdev, dev);
> +
> +	ret = ofdrm_device_init_pci(odev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	/*
> +	 * OF display-node settings
> +	 */
> +
> +	width = display_get_width_of(dev, of_node);
> +	if (width < 0)
> +		return ERR_PTR(width);
> +	height = display_get_height_of(dev, of_node);
> +	if (height < 0)
> +		return ERR_PTR(height);
> +	depth = display_get_depth_of(dev, of_node);
> +	if (depth < 0)
> +		return ERR_PTR(depth);
> +	linebytes = display_get_linebytes_of(dev, of_node);
> +	if (linebytes < 0)
> +		return ERR_PTR(linebytes);
> +
> +	format = display_get_validated_format(dev, depth);
> +	if (IS_ERR(format))
> +		return ERR_CAST(format);
> +	if (!linebytes) {
> +		linebytes = drm_format_info_min_pitch(format, 0, width);
> +		if (drm_WARN_ON(dev, !linebytes))
> +			return ERR_PTR(-EINVAL);
> +	}
> +
> +	fb_size = linebytes * height;
> +
> +	/*
> +	 * Try to figure out the address of the framebuffer. Unfortunately, Open
> +	 * Firmware doesn't provide a standard way to do so. All we can do is a
> +	 * dodgy heuristic that happens to work in practice.
> +	 *
> +	 * On most machines, the "address" property contains what we need, though
> +	 * not on Matrox cards found in IBM machines. What appears to give good
> +	 * results is to go through the PCI ranges and pick one that encloses the
> +	 * "address" property. If none match, we pick the largest.
> +	 */
> +	address = display_get_address_of(dev, of_node);
> +	if (address != OF_BAD_ADDR) {
> +		struct resource fb_res = DEFINE_RES_MEM(address, fb_size);
> +
> +		res = ofdrm_find_fb_resource(odev, &fb_res);
> +		if (!res)
> +			return ERR_PTR(-EINVAL);
> +		if (resource_contains(res, &fb_res))
> +			fb_base = address;
> +		else
> +			fb_base = res->start;
> +	} else {
> +		struct resource fb_res = DEFINE_RES_MEM(0u, fb_size);
> +
> +		res = ofdrm_find_fb_resource(odev, &fb_res);
> +		if (!res)
> +			return ERR_PTR(-EINVAL);
> +		fb_base = res->start;
> +	}
> +
> +	/*
> +	 * I/O resources
> +	 */
> +
> +	fb_pgbase = round_down(fb_base, PAGE_SIZE);
> +	fb_pgsize = fb_base - fb_pgbase + round_up(fb_size, PAGE_SIZE);
> +
> +	ret = devm_aperture_acquire_from_firmware(dev, fb_pgbase, fb_pgsize);
> +	if (ret) {
> +		drm_err(dev, "could not acquire memory range %pr: error %d\n", &res, ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	mem = devm_request_mem_region(&pdev->dev, fb_pgbase, fb_pgsize, drv->name);
> +	if (!mem) {
> +		drm_warn(dev, "could not acquire memory region %pr\n", &res);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	screen_base = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
> +	if (!screen_base)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/*
> +	 * Firmware framebuffer
> +	 */
> +
> +	iosys_map_set_vaddr_iomem(&odev->screen_base, screen_base);
> +	odev->mode = ofdrm_mode(width, height);
> +	odev->format = format;
> +	odev->pitch = linebytes;
> +
> +	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&odev->mode));
> +	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, linebytes=%d byte\n",
> +		&format->format, width, height, linebytes);
> +
> +	/*
> +	 * Mode-setting pipeline
> +	 */
> +
> +	ret = drmm_mode_config_init(dev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	max_width = max_t(unsigned long, width, DRM_SHADOW_PLANE_MAX_WIDTH);
> +	max_height = max_t(unsigned long, height, DRM_SHADOW_PLANE_MAX_HEIGHT);
> +
> +	dev->mode_config.min_width = width;
> +	dev->mode_config.max_width = max_width;
> +	dev->mode_config.min_height = height;
> +	dev->mode_config.max_height = max_height;
> +	dev->mode_config.funcs = &ofdrm_mode_config_funcs;
> +	switch (depth) {
> +	case 32:
> +		dev->mode_config.preferred_depth = 24;
> +		break;
> +	default:
> +		dev->mode_config.preferred_depth = depth;
> +		break;
> +	}
> +
> +	/* Primary plane */
> +
> +	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
> +					    ofdrm_primary_plane_formats,
> +					    ARRAY_SIZE(ofdrm_primary_plane_formats),
> +					    odev->formats, ARRAY_SIZE(odev->formats));
> +
> +	primary_plane = &odev->primary_plane;
> +	ret = drm_universal_plane_init(dev, primary_plane, 0, &ofdrm_primary_plane_funcs,
> +				       odev->formats, nformats,
> +				       ofdrm_primary_plane_format_modifiers,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	drm_plane_helper_add(primary_plane, &ofdrm_primary_plane_helper_funcs);
> +	drm_plane_enable_fb_damage_clips(primary_plane);
> +
> +	/* CRTC */
> +
> +	crtc = &odev->crtc;
> +	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
> +					&ofdrm_crtc_funcs, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	drm_crtc_helper_add(crtc, &ofdrm_crtc_helper_funcs);
> +
> +	/* Encoder */
> +
> +	encoder = &odev->encoder;
> +	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	/* Connector */
> +
> +	connector = &odev->connector;
> +	ret = drm_connector_init(dev, connector, &ofdrm_connector_funcs,
> +				 DRM_MODE_CONNECTOR_Unknown);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	drm_connector_helper_add(connector, &ofdrm_connector_helper_funcs);
> +	drm_connector_set_panel_orientation_with_quirk(connector,
> +						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
> +						       width, height);
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	drm_mode_config_reset(dev);
> +
> +	return odev;
> +}
> +
> +/*
> + * DRM driver
> + */
> +
> +DEFINE_DRM_GEM_FOPS(ofdrm_fops);
> +
> +static struct drm_driver ofdrm_driver = {
> +	DRM_GEM_SHMEM_DRIVER_OPS,
> +	.name			= DRIVER_NAME,
> +	.desc			= DRIVER_DESC,
> +	.date			= DRIVER_DATE,
> +	.major			= DRIVER_MAJOR,
> +	.minor			= DRIVER_MINOR,
> +	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
> +	.fops			= &ofdrm_fops,
> +};
> +
> +/*
> + * Platform driver
> + */
> +
> +static int ofdrm_probe(struct platform_device *pdev)
> +{
> +	struct ofdrm_device *odev;
> +	struct drm_device *dev;
> +	int ret;
> +
> +	odev = ofdrm_device_create(&ofdrm_driver, pdev);
> +	if (IS_ERR(odev))
> +		return PTR_ERR(odev);
> +	dev = &odev->dev;
> +
> +	ret = drm_dev_register(dev, 0);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * FIXME: 24-bit color depth does not work reliably with a 32-bpp
> +	 * value. Force the bpp value of the scanout buffer's format.
> +	 */
> +	drm_fbdev_generic_setup(dev, drm_format_info_bpp(odev->format, 0));
> +
> +	return 0;
> +}
> +
> +static int ofdrm_remove(struct platform_device *pdev)
> +{
> +	struct drm_device *dev = platform_get_drvdata(pdev);
> +
> +	drm_dev_unplug(dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ofdrm_of_match_display[] = {
> +	{ .compatible = "display", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ofdrm_of_match_display);
> +
> +static struct platform_driver ofdrm_platform_driver = {
> +	.driver = {
> +		.name = "of-display",
> +		.of_match_table = ofdrm_of_match_display,
> +	},
> +	.probe = ofdrm_probe,
> +	.remove = ofdrm_remove,
> +};
> +
> +module_platform_driver(ofdrm_platform_driver);
> +
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index cfc55273dc5d..a98987aa2784 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -455,6 +455,7 @@ config FB_ATARI
>  config FB_OF
>  	bool "Open Firmware frame buffer device support"
>  	depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
> +	depends on !DRM_OFDRM

This breaks build - see
https://lore.kernel.org/linux-kbuild/CAK7LNASBhTvzkjXuJDH8ePCVXnZ=GUYdNa-OU+QURbBp3oyEBQ@mail.gmail.com/

Thanks

Michal

>  	select APERTURE_HELPERS
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
> -- 
> 2.37.3
> 
