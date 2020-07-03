Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357DE213BEE
	for <lists+linux-fbdev@lfdr.de>; Fri,  3 Jul 2020 16:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgGCOj4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 3 Jul 2020 10:39:56 -0400
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21765 "EHLO
        sender4-of-o57.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgGCOj4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 3 Jul 2020 10:39:56 -0400
X-Greylist: delayed 903 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 Jul 2020 10:39:56 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1593786277; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=YD5HBn0ew2QDQkvGb3z0aqAM4pIFvC4VAt2TXNkuFwzZ6MUj9fQelce2qSSm9GJvfMn1E9kyuocb/oNNN7u7oNWX0idasYDdM+ati1n5A1HPjATlPf/GpQMmvbbV6CPfvGfaLYn7FP6yXlmjISgJ5kxbvyYByAfpP4X6HRS/lBo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1593786277; h=Content-Type:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=mHfqeTV/OAFRPJkymwJ/yrF4XNt3RmPWXeOFHypvR0g=; 
        b=R+svHu776OudBhmv1VKQwF29mHDN4+hUgAQvimtlK8QpdmHONwwUENoVD70rBu9iE3o8DQbP1pKIbkv7IwYRqKpqImdpn2qX7ZKcEC+ALxGP0rxyUta/q7KT8eYgo8wHOADRtkKJO9dMry7yHWqYJdPHhcjmesurL4u5dHb1efo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=qubes-os.org;
        spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
        dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1593786277;
        s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
        h=From:Subject:To:Cc:Message-ID:Date:MIME-Version:Content-Type;
        bh=mHfqeTV/OAFRPJkymwJ/yrF4XNt3RmPWXeOFHypvR0g=;
        b=kLfqLr33dv9gjO2ihDXNju2EWOc6PlwwOTwg9qvpZXfTl2ESaHEvrA+w1wnF0SFQ
        NeS3Q95p3NfDubrE4wKX0ioB4N813yviryOaYpQRCZy39PcJ4n9GbgyZ5YilkJxP1Rv
        1DUNSmSaJO1lEN+hNsJssgjJRgPLDnQ1jQlXRoC0=
Received: from [10.137.0.45] (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
        with SMTPS id 1593786275485103.42683310504424; Fri, 3 Jul 2020 07:24:35 -0700 (PDT)
From:   =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= 
        <frederic.pierret@qubes-os.org>
Subject: dummy-backlight
To:     lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, b.zolnierkie@samsung.com,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org
Cc:     =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= 
        <marmarek@invisiblethingslab.com>
Message-ID: <903f7645-5062-00a9-8d7c-b30ef5f54951@qubes-os.org>
Date:   Fri, 3 Jul 2020 16:24:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4fGmdG7NnKFN1M86H79xV4JfD01yLcbyk"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4fGmdG7NnKFN1M86H79xV4JfD01yLcbyk
Content-Type: multipart/mixed; boundary="Q7nSMCZKXlHpZb2Yy992XltX3EiXUZfr7"

--Q7nSMCZKXlHpZb2Yy992XltX3EiXUZfr7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Dear all,

I'm working on a simple kernel module currently called "dummy-backlight" =
(https://github.com/fepitre/dummy-backlight) which creates a testing back=
light. After loaded, this driver allows to modify integer values of the v=
irtual backlight created through its sysfs attributes directly.

In the context of the Qubes OS project, it allows to setup into a VM, a v=
irtual backlight and managing the hardware backlight into the VM directly=
 thanks to a communication channel with the host system.

I'm writing to you to know if you would be interested to have such module=
 into kernel. Another name could be "virtual-backlight".

I've written a similar module for PSU too (https://lore.kernel.org/linux-=
pm/a8223cce-636f-578b-7304-eb0e4868e018@qubes-os.org/) where a nice sugge=
stion of improvement has been made to use a misc device for controlling a=
ttributes instead of sysfs directly. Indeed, it's appropriated in case of=
 multiple PSU but maybe for a (only one?) "dummy-backligh", using two sys=
fs attributes is enough.

Any kind of improvements are very welcomed. Thank you.

Best regards,
Fr=C3=A9d=C3=A9ric Pierret


--Q7nSMCZKXlHpZb2Yy992XltX3EiXUZfr7--

--4fGmdG7NnKFN1M86H79xV4JfD01yLcbyk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl7/P58ACgkQSEAQtc3F
duIIehAAop77snM7y/Bd9ln0IS+FiUw6eZcj5mp+0oKi1xjKbiCui/6WfVFwYzki
Q500M5gH/6r3jXf1wBOiZIkRVgj9TKkKiOlPJDCqTSBMKEYV3n7P4yrq0Lr+dTlf
qvXBOnzQlG2GuTDvGz3UOOmHLaa/NV4P7wQusNVkj2dCBBMoC4QJsuwnA2jVZHdI
4Va19Yijrfpx+8pWgb5/yTHuo/yjxCiobTRsFQI+qas15KbJ0r+wHHESD4qZ+T8M
FIrDLUIcUAV3orMjLkx1b6KxG/1aMtXwYH+bIpswFbhJ9iw/jhuemEtiJnM+Zbf2
1iviZSzlICZB3hsEmzqcFPGdAXZj+O6cdm30wl7kMQeZiPzkGg9WMaQ/c7/AUcPb
hwBI7KteyvkGahM7nkooIaJnu29+Yc9KS8r5RhedPA1fJycxSsZniPudRLwh186G
9TqTqTDyYkTbnhsjQQTOosUqlwYG1sgk9Xs64glgiAl6WAbWTYOrj4W2bNyw/jDx
RYbGBV0PwpCASCOyZhMk++oPeloQytLN17y1AQO+tM+t/UjK1FHWlSZ1fD3BlZVg
m6qItivxR+I6kvrOM4AhTZrR5h6nS0R0WHaVyvoxSnrcdO/t0K4m2T+MZxD8If8P
4g31Uk6bcm3kOQ29ifCnnkJXPwoJWPrksG88/sKxe7nmdPyQdag=
=NWRT
-----END PGP SIGNATURE-----

--4fGmdG7NnKFN1M86H79xV4JfD01yLcbyk--
